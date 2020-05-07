<?php

namespace App\Http\Controllers\Index;

use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Setting;
use QrCode;
use GuzzleHttp;
use App\Models\SignToken;
class IndexController extends Controller
{
    public function index(){
        return view('index');
    }


    public function getQrCode(){
        $randMd5 = md5(rand(0,9999)+rand(0,9999)+rand(0,9999));
        $url = 'http://passport2.chaoxing.com/createqr?uuid='.$randMd5.'&xxtrefer=&type=0&mobiletip=';
        $client = new GuzzleHttp\Client();
        $imgData = $client->request('GET',$url)->getBody();
        $qrcode = new \QrReader($imgData);
        $enCode = urlHandle($qrcode->text());
        $qrUrl = $qrcode->text();
        $qrUrl=!empty($qrUrl)?$qrUrl:'error';
        $qrImg = QrCode::size(230)->generate($qrUrl);
        return response()->json(['code'=>1,'qrimg'=>$qrImg,'rand'=>$randMd5,'enc'=>$enCode]);
    }

    public function login(Request $request){
        $this->validate($request,[
            "rand" => "required",
            "enc" => "required",
        ]);
        $randMd5 = $request->get('rand');
        $enCode = $request->get('enc');
        $client = new GuzzleHttp\Client();
        $url = 'http://passport2.chaoxing.com/getauthstatus';
        $postRes = $client->request('POST',$url,[
            'form_params' =>[
                'uuid' => $randMd5,
                'enc' => $enCode
            ]
        ]);
        $resCookie = headerHandle($postRes->getHeader('Set-Cookie'));
        $postRes = $postRes->getBody()->getContents();
        if(is_json($postRes)){
            $postRes = json_decode($postRes);
            //对类型进行检查
            $postRes->type = !empty($postRes->type)?$postRes->type:'0';
            switch ($postRes->type){
                case '2':
                    return response()->json(['code'=>1,'msg'=>'二维码已失效，请刷新界面','data'=>[]]);
                    break;
                case '3':
                    return response()->json(['code'=>2,'msg'=>'二维码等待扫描，请扫描二维码','data'=>[]]);
                    break;
                case '4':
                    session()->put(['uid'=>$postRes->uid]);
                    session()->put(['nickname'=>$postRes->nickname]);
                    return response()->json(['code'=>3,'msg'=>'二维码已被扫描,请在APP确认登录','data'=>['uid'=>$postRes->uid]]);
                    break;
            }
            //是否扫描完毕
            if($postRes->status) {
                $uid = $request->has('uid')?$request->get('uid'):'';
                if (session()->has('uid') &&$uid == session()->get('uid')) {
                    session()->put(['cookie' => $resCookie]);
                    return response()->json(['code' => 0, 'msg' => '扫码成功，已完成登录', 'data' => [
                        'nickname'=>session()->get('nickname')
                    ]]);
                }else{
                    return response()->json(['code' => 4, 'msg' => '你并没有按照步骤来完成，系统没有获取到你的UID', 'data' => []]);
                }
            }

        }
        return response()->json(['code'=>-1,'msg'=>'数据异常，请重新扫码','data'=>[]]);
    }


    public function sign(Request $request){
        $this->validate($request,[
            "nickname" => "required",
            "uid" => "required",
        ]);
        $setting = Setting::first();
        if($setting->web_status === 2){
            return response()->json(['code'=>-1,'msg'=>'系统已关闭，请联系管理员','data'=>[]]);
        }
        $nickname = $request->get('nickname');
        $uid = $request->get('uid');
        if(session()->get('nickname') == $nickname && session()->get('uid') == $uid && session()->has('cookie')){
            $cookie = session()->get('cookie');
            try{
                SignToken::updateOrCreate(
                    ['uuid'=>$uid],['name'=>$nickname,'cookie'=>base64_encode($cookie)]
                );
            }catch(QueryException $e){
                return response()->json(['code'=>-1,'msg'=>'添加数据失败，系统发生错误','data'=>[]]);
            }

            return response()->json(['code'=>0,'msg'=>'添加成功，已开启自动签到','data'=>[]]);
        }
        return response()->json(['code'=>-1,'msg'=>'数据异常，请重新扫码','data'=>[]]);
    }
}
