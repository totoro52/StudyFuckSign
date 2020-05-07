<?php

namespace App\Admin\Controllers;

use App\Models\SignToken;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class SignTokenController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '签到令牌';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new SignToken());

        $grid->column('id', __('ID'));
        $grid->column('uuid', __('UUID'));
       # $grid->column('cookie', __('令牌数据'));
        $grid->column('name', __('用户名'));
        $grid->column('created_at', __('创建时间'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(SignToken::findOrFail($id));

        $show->field('id', __('ID'));
        $show->field('uuid', __('UUID'));
        $show->field('cookie', __('令牌数据'));
        $show->field('name', __('用户名'));
        $show->field('created_at', __('创建时间'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new SignToken());

        $form->number('uuid', __('Uuid'));
        $form->text('cookie', __('Cookie'));
        $form->text('name', __('Name'));

        return $form;
    }
}
