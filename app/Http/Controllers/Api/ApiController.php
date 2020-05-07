<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Setting;
use App\Models\SignToken;
class ApiController extends Controller
{
    //
    public function getSignItem(Request $request){
        if($request->has('api_key')){
            $setting = Setting::first();
            $api_key = $request->get('api_key');
            if($setting->api_key === $api_key){
                $signItem = SignToken::all();
                return response()->json(['code'=>1,'msg'=>'获取成功','data'=>$signItem]);
            }else{
                return response()->json(['code'=>1,'msg'=>'密钥错误,滚','data'=>[]]);
            }
        }else{
            return response()->json(['code'=>1,'msg'=>'请输入密钥','data'=>[]]);
        }
    }
}
