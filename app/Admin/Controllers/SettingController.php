<?php

namespace App\Admin\Controllers;

use App\Admin\Forms\Setting\Basic;
use Encore\Admin\Layout\Content;
use Encore\Admin\Widgets\Tab;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SettingController extends Controller
{

    public function index(Content $content){
        $forms = [
            'basic' => Basic::class
        ];
        return $content
            ->title('网站设置')
            ->body(Tab::forms($forms));
    }
}
