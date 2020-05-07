<!doctype html>
<html  lang="en">

<head>
    <!-- meta data -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!--font-family-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&amp;subset=devanagari,latin-ext" rel="stylesheet">

    <!-- title of site -->
    <title>自动签到</title>

    <!-- For favicon png -->
    <link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>

    <!--font-awesome.min.css-->
    <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/5.12.1/css/all.min.css">

    <!--animate.css-->
    <link rel="stylesheet" href="https://cdn.bootcss.com/animate.css/3.7.2/animate.min.css">

    <!--bootstrap.min.css-->
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.6/css/bootstrap.min.css">

    <!-- bootsnav -->
    <link rel="stylesheet" href="css/bootsnav.css" >

    <!--style.css-->
    <link rel="stylesheet" href="css/style.css">

    <!--responsive.css-->
    <link rel="stylesheet" href="css/responsive.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <style>
        [v-cloak]{
            display: none
        }
    </style>

</head>
<body>
<div id="app">
<!-- signin end -->
<section class="signin signup popup-in pop-up">
    <div class="container">

        <div class="sign-content popup-in-content">
            <div class="popup-in-txt">
                <h2>自动签到</h2>

                <div class="signin-form">
                    <div class=" ">
                            <p>使用说明：</p>
                            <p>第1步：扫码登录,请使用学习通APP扫码该二维码但不要确认登录(手机可截图保存相册)</p>
                            <p>第2步：返回网站点击下面的按钮，返回学习通APP点击确认登录。</p>
                            <p>第3步：确认课程，确认课程后开启自动签到</p>
                            <p>PS：本系统不能完全代替签到，请随时留意签到情况。(本站完全免费)</p>
                            <p>前端技术：Vue.js 后端技术：Laravel 数据处理：Python+Java</p>
                            <p>By：龙猫</p>
                    </div><!--/.row -->
                </div><!--/.signin-form -->

                <div class="animated  signin-footer rubberBand">
                    <div style="display:flex;align-items: center;justify-content: center" v-html="qrCode">
                    </div>
                    <button type="button" :disabled="isClick"  @click="btnClick()" class="btn signin_btn signin_btn_two">
                        <span v-cloak>@{{ btnTittle }}</span>
                    </button>

                </div><!--/.signin-footer -->
            </div><!-- .popup-in-txt -->
        </div><!--/.sign-content -->
    </div><!--/.container -->

</section><!--/.signin -->

<!-- signin end -->

<!--footer copyright start -->
<footer class="footer-copyright">
    <div id="scroll-Top">
        <i class="fa fa-angle-double-up return-to-top" id="scroll-top" data-toggle="tooltip" data-placement="top" title="" data-original-title="Back to Top" aria-hidden="true"></i>
    </div><!--/.scroll-Top-->

</footer><!--/.hm-footer-copyright-->
<!--footer copyright  end -->
</div>
<script src="https://cdn.bootcss.com/vue/2.6.11/vue.min.js"></script>
<script src="https://cdn.bootcss.com/axios/0.19.2/axios.min.js"></script>
<script src="js/toast.js"></script>
</body>
<script>
    console.log([
        "                   _ooOoo_",
        "                  o8888888o",
        "                  88\" . \"88",
        "                  (| -_- |)",
        "                  O\\  =  /O",
        "               ____/`---'\\____",
        "             .'  \\\\|     |//  `.",
        "            /  \\\\|||  :  |||//  \\",
        "           /  _||||| -:- |||||-  \\",
        "           |   | \\\\\\  -  /// |   |",
        "           | \\_|  ''\\---/''  |   |",
        "           \\  .-\\__  `-`  ___/-. /",
        "         ___`. .'  /--.--\\  `. . __",
        "      .\"\" '<  `.___\\_<|>_/___.'  >'\"\".",
        "     | | :  `- \\`.;`\\ _ /`;.`/ - ` : | |",
        "     \\  \\ `-.   \\_ __\\ /__ _/   .-` /  /",
        "======`-.____`-.___\\_____/___.-`____.-'======",
        "                   `=---='",
        "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^",
        "         佛祖保佑       永无BUG"
    ].join('\n'));
    var vm = new Vue({
        el : "#app",
        mounted(){
            axios.get('/getQrCode')
                .then(ret=>{
                    if(ret.statusText=="OK" && ret.data.code == 1){
                        if(ret.data.qrimg!="error"){
                            this.qrCode = ret.data.qrimg
                            this.enc = ret.data.enc
                            this.rand = ret.data.rand
                            this.isClick = false
                        }
                    }
                })
                .catch(err=>{

                })
        },
        data : {
            isClick:true,
            enc: '',
            rand: '',
            uid : '',
            nickName : '',
            qrCode: '<b>正在获取二维码中...</b>',
            btnTittle : '我已扫描但没确认',
            status : 3,
            clickType :1,
        },
        methods:{
            btnClick(){
                this.btnTittle = '正在发送请求中'
                this.isClick = true;
                switch (this.clickType){
                    case 1:
                        this.getLogin()
                        break;
                    case 2:
                        this.getSign()
                        break;
                }

            },
            getLogin(){
                var postData = new URLSearchParams();
                postData.append('rand',this.rand);
                postData.append('enc',this.enc);
                postData.append('uid',this.uid);
                axios.post('/login',postData)
                    .then(ret=>{
                        if(ret.statusText=="OK"){
                            switch(ret.data.code){
                                case 0:
                                    Toast(ret.data.msg,2000);
                                    this.btnTittle = '开启自动签到';
                                    this.nickName = ret.data.data.nickname;
                                    this.qrCode = '<b>'+ this.nickName +' 欢迎您</b>';
                                    this.isClick = false;
                                    this.clickType = 2;
                                    break;
                                case 1:
                                    Toast(ret.data.msg,2000);
                                    this.btnTittle = '请刷新界面';
                                    this.isClick = true;
                                    break;
                                case 2:
                                    Toast(ret.data.msg,2000);
                                    this.btnTittle = '我已扫描但未确认';
                                    this.isClick = false;
                                    break;
                                case 3:
                                    Toast(ret.data.msg,2000);
                                    this.btnTittle = '我已在APP确认登录';
                                    this.isClick = false;
                                    this.uid = ret.data.data.uid;
                                    break;
                                case 4:
                                    Toast(ret.data.msg,2000);
                                    this.btnTittle = '请刷新界面';
                                    this.isClick = true;
                                    break;
                                default:
                                    Toast(ret.data.msg,2000);
                                    this.btnTittle = '请刷新界面';
                                    this.isClick = true;
                                    break;
                            }
                        }
                    })
                    .catch(err=>{

                    })
            },
            getSign(){
                var postData = new URLSearchParams();
                postData.append('uid',this.uid);
                postData.append('nickname',this.nickName);
                axios.post('/sign',postData)
                    .then(ret=>{
                        if(ret.statusText=="OK"){
                            switch(ret.data.code) {
                                case 0:
                                    Toast(ret.data.msg, 2000);
                                    this.btnTittle = '您已开启自动签到';
                                    this.qrCode = '<b style="color: #bd2130">您已开启自动签到，同时请随时留意签到情况，机器不能保证完全代替人类，现在你可以请关闭网页了，阿门！<b>'
                                    this.isClick = true;
                                    break;
                                default:
                                    Toast(ret.data.msg,2000);
                                    this.btnTittle = '请刷新界面';
                                    this.isClick = true;
                                    break;
                            }
                        }
                    })
                    .catch(err=>{

                    })

            }
        },
    })
</script>
</html>