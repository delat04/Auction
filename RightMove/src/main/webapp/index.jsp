<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login and Signup</title>
    <style>
        @import url("https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400");
        @import url("https://fonts.googleapis.com/css?family=Playfair+Display");

        body,
        .message,
        .form,
        form {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        body {
            height: 100vh;
            background: #e8e8e8;
            font-family: 'Source Sans Pro', sans-serif;
            overflow: hidden;
        }

        .container {
            width: 700px;
            height: 400px;
            background: white;
            position: relative;
            display: grid;
            grid-template: 100% / 50% 50%;
            box-shadow: 2px 2px 10px 0 rgba(51, 51, 51, 0.2);
        }

        .message {
            position: absolute;
            background: white;
            width: 50%;
            height: 100%;
            transition: 0.5s all ease;
            transform: translateX(100%);
            z-index: 4;

            &:before {
                position: absolute;
                content: "";
                width: 1px;
                height: 70%;
                background: #c3c3d8;
                opacity: 0;
                left: 0;
                top: 15%;
            }

            .button {
                margin: 5px 0;
            }
        }

        .signup {
            &:before {
                opacity: 0.3;
                left: 0;
            }
        }

        .login {
            &:before {
                opacity: 0.3;
                left: 100%;
            }
        }

        .btn-wrapper {
            width: 60%;
        }

        .form {
            width: 100%;
            height: 100%;

            &--heading {
                font-size: 25px;
                height: 50px;
                color: #129D72;
                font-family: 'Source Sans Pro', sans-serif;
            }

            &--signup {
                border-right: 1px solid #999;
            }
        }

        form {
            width: 70%;
            > * {
                margin: 10px;
            }
            input {
                width: 90%;
                border: 0;
                border-bottom: 1px solid #aaa;
                font-size: 13px;
                font-weight: 300;
                color: #797a9e;
                letter-spacing: 0.11em;

                &::placeholder {
                    color: #333;
                    font-size: 10px;
                }

                &:focus {
                    outline: 0;
                    border-bottom: 1px solid rgba(130, 155, 206, 0.7);
                    transition: 0.6s all ease;
                }
            }
        }

        .button {
            width: 100%;
            height: 30px;
            border: 0;
            outline: 0;
            color: white;
            font-size: 15px;
            font-weight: 400;
            position: relative;
            z-index: 3;
            background: #129D72;
            font-family: 'Source Sans Pro', sans-serif;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <div class="container">
        
        <div class="form form--signup">
            <div class="form--heading">Welcome! Sign Up</div>
            <form action="user" method="post">
                <input type="text" name="username" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="hidden" name="action" value="signup">
                <button type="submit" class="button">Signup</button>
            </form>
        </div>

        <div class="form form--login">
            <div class="form--heading">Welcome back! </div>
            <form action="user" method="post">
                <input type="text" name="username" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="hidden" name="action" value="login">
                <button type="submit" class="button">Login</button>
            </form>
        </div>
    </div>

    <script>
        document.querySelector(".button#signup").addEventListener("click", function() {
            document.querySelector(".message").style.transform = "translateX(100%)";
            if (document.querySelector(".message").classList.contains("login")) {
                document.querySelector(".message").classList.remove("login");
            }
            document.querySelector(".message").classList.add("signup");
        });

        document.querySelector(".button#login").addEventListener("click", function() {
            document.querySelector(".message").style.transform = "translateX(0)";
            if (document.querySelector(".message").classList.contains("signup")) {
                document.querySelector(".message").classList.remove("signup");
            }
            document.querySelector(".message").classList.add("login");
        });
    </script>

