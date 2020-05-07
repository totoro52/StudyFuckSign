<?php

namespace App\Admin\Forms\Setting;

use App\Models\Setting;
use Encore\Admin\Widgets\Form;
use Illuminate\Http\Request;

class Basic extends Form
{
    /**
     * The form title.
     *
     * @var string
     */
    public $title = '基本配置';

    /**
     * Handle the form request.
     *
     * @param Request $request
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request)
    {

        $web_status = (int)$request->get('web_status');
        Setting::updateOrCreate(
            ['id'=>1],[
                'title'=>$request->get('title'),
                'api_key'=>md5($request->get('api_key')),
                'web_status'=>$web_status
            ]
        );
        admin_success('保存成功...');

        return back();
    }

    /**
     * Build a form here.
     */
    public function form()
    {
        $this->text('title',__('网站标题'))->rules('required');
        $this->text('api_key',__('数据通讯令牌'))->rules('required');
        $this->radio('web_status',__('网站开关'))->options([1 => '开启', 2=>'关闭'])->rules('required');
    }

    /**
     * The data of the form.
     *
     * @return array $data
     */
    public function data()
    {
        $setting = Setting::first();
        return [
            'title'       => isset($setting->title)?$setting->title:'',
            'api_key'      => isset($setting->api_key)?$setting->api_key:'',
            'web_status'      => isset($setting->web_status)?$setting->web_status:1,
            'created_at' => now(),
        ];
    }
}
