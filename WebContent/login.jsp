<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        ul li {
            list-style: none;
        }

        #wrap {
            width: 40%;
            height: 400px;
            margin: 30px auto;
            border-radius: 15px;
            background: #F6F6F6;
            position: relative;
            overflow: hidden;
        }

        .intro {
            width: 40%;
            height: 100%;
            transform: translateX(-20%);
            border-radius: 15px 0 0 15px;
            background:#FAE0D4;
            display: inline-block;
            vertical-align: middle;
            position: absolute;
            left: 0;
            transition: all 1s;
            z-index: 100;
            text-align: right;
            box-shadow: 0 0 4px #ccc;
        }
        .intro_wrap{
            display: inline-block;
            width: 80%;
            height: 100%;
            text-align: center;
        }
        .logo {
            width: 100px;
            height: 50px;
            margin: 20px auto;
        }

        .logo img {
            width: 100%;
        }
        .intro .intro_title{
            text-align: center;
            font-weight: 500;
            font-size: 25px;
            text-transform: uppercase;
            margin:70px auto 20px;
            color: #666;
        }
        .intro p{
            font-size: 12px;
            margin-bottom: 20px;
            color: #666;
        }
        .intro .login{
            cursor: pointer;
            outline: none;
            border: 2px solid #999;
            border-radius: 20px;
            width: 100px;
            height: 30px;
            background: none;
            color: #999;
            transition: all .5s;
        }

        .intro .login:hover, form .join:hover{
            background: #fff;
            color: #999;
            border: 2px solid #fff;
        }

        form {
            width: 65%;
            height: 100%;
            display: inline-block;
            vertical-align: middle;
            position: absolute;
            right: 0;
            transition: all 1.5s;
            text-align: center;
        }
        form .main_title{
            text-align: center;
            font-weight: 500;
            font-size: 25px;
            text-transform: uppercase;
            margin:50px 0 20px 0;
            color: #666;
        }
        form p{
            font-size: 12px;
            margin-bottom:20px  ;
            color: #666;
        }
        form .social{
            text-align: center;
            display: block;
        }
        form .social li{
            width: 20px;
            height: 20px;
            border: 1px solid #f00;
            border-radius: 50%;
            display: inline-block;
        }
        form .text_box li{
            margin: 10px 0;
        }
        form .text_box li input[type="text"], input[type="password"], input[type="email"]{
            width: 250px;
            height: 30px;
            border: none;
            outline: none;
            cursor: pointer;
            color: #666;
            padding-left: 10px;
        }
        form .join{
            cursor: pointer;
            outline: none;
            border: 2px solid #999;
            border-radius: 20px;
            width: 100px;
            height: 30px;
            background: none;
            color: #999;
            transition: all .5s;
        }
        form .none {
            display: inline-block;
        }
    </style>
    <script src="js/jquery-3.5.1.min.js"></script>
    <script>
        $(document).ready(function () {
            var login = $('.login');
            var join = $('.join');
            var intro_title = $('.intro_title');
            var main_title = $('.main_title');
            var none = $('.none');

            login.click(function () {
                var intro = $('.intro');
                var form = $('form');
                if($(this).hasClass('on')){
                    intro.css({ 'transform': 'translateX(170%)' ,'border-radius': '0 15px 15px 0', 'text-align':'left'});
                    intro_title.text('Hello');
                    form.css({ 'right': '34%' });
                    main_title.text('LOGIN');

                    none.css({ 'display': 'none' });
                    login.val('SIGN UP').removeClass('on');
                    join.val('SIGN IN').removeClass('active');

                }else{
                    intro.css({ 'transform': 'translateX(-20%)' ,'border-radius': '15px 0 0 15px','text-align':'right'});
                    intro_title.text('Welcome');
                    form.css({'right':0});
                    main_title.text('JOIN');
                    none.css({'display':'inline-block'});
                    login.val('SIGN IN').addClass('on');
                    join.val('SIGN UP').addClass('active');
                }
            });

        });
    </script>
</head>

<body>
    <div id="wrap">
        <div class="intro">
            <div class="intro_wrap">
                <h1 class="logo"><img src="images/yankeecandle_logo_redesign.png" alt=""></h1>
                <h1 class="intro_title">Welcome</h1>
                <p>본문에 들어갈 내용을 입력하세요.</p>
                <input type="button" value="SIGN IN" class="login on" name="cmd">
                <!-- <span class="login">SIGN IN</span> -->
            </div>
        </div>
        <form action="login_result.jsp" method="post">
            <h1 class="main_title">JOIN</h1>
            <p>본문에 들어갈 내용을 입력하세요.</p>
            <ul class="text_box">
                <li><input type="text" placeholder="Name" class="none" name="username"></li>
                <li><input type="text" placeholder="Id" name="userid"></li>
                <li><input type="password" placeholder="Password" name="userpw"></li>
                <li><input type="email" placeholder="Email" class="none" name="useremail"></li>
                <li><input type="submit" value="SIGN UP" class="join active" name="cmd"></li>
            </ul>
        </form>
    </div>
</body>

</html>