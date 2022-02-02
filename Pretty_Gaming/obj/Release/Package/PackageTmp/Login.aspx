<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pretty_Gaming.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=1480" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Agent Pretty Gaming</title>
    <link rel="icon" href="img/logoTab.png" />
    <link href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/mdb.min.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <style>
        .waves-input-wrapper {
            display: block !important;
        }

        .captcha {
            width: 223px;
            height: 80px;
            background: #ececec;
            border-radius: 15px;
        }

        #captcha::placeholder {
            text-align: center;
        }

        #captcha:-ms-input-placeholder {
            /* Internet Explorer 10-11 */
            text-align: center;
        }

        #captcha::-ms-input-placeholder {
            /* Microsoft Edge */
            text-align: center;
        }

        .label {
            font-weight: 400;
        }

        .bg {
            background-image: url("img/Carnival/valentine.jpg");
        }

        canvas {
            height: 100%;
            left: 0;
            position: absolute;
            top: 0;
            width: 100%;
        }
    </style>
</head>
<body class="login-page">
    <canvas></canvas>
    <div id="myModalLoad" class="modal" data-backdrop="static" data-keyboard="false">
        <div class="d-flex justify-content-center" style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); color: #CFA137 !important;">
            <div class="spinner-border" role="status" style="width: 10rem; height: 10rem; font-size: 5rem;">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
    </div>
    <form runat="server" class="login-page bg">
        <div class="wrapper container h-100 d-flex justify-content-center align-items-center">
            <div class="login-section">
                <div class="card">
                    <div class="login-footer pt-4" style="padding-top: 1rem !important; border-bottom: 1px #fff solid; padding-bottom: 1rem !important;">
                        <a style="color: #fff;" id="txtLan">
                            <img src="img/Flag/usa.png" style="width: 20px;" />&emsp;English</a>
                        <div id="divblock" style="display: none; left: 8rem;">
                            <div style="border-bottom: 1px #ddd solid; padding: 3px;">
                                <a onclick="SetLanguage('Thai');">
                                    <img src="img/Flag/thailand.png" style="width: 20px;" />&emsp;ไทย
                                </a>
                            </div>
                            <div style="border-bottom: 1px #ddd solid; padding: 3px;">
                                <a onclick="SetLanguage('English');">
                                    <img src="img/Flag/usa.png" style="width: 20px;" />&emsp;English
                                </a>
                            </div>
                            <div style="padding: 3px;">
                                <a onclick="SetLanguage('Chinese');">
                                    <img src="img/Flag/china.png" style="width: 20px;" />&emsp;中文
                                </a>
                            </div>
                        </div>
                        <a href="#" class="nav-link" set-lan="html:Mobile Version" style="color: #fff;">
                            <i class="fas fa-mobile"></i>
                            Mobile Version
                        </a>
                    </div>
                    <div class="card-header text-center">
                        <a href="#" class="logo mx-auto">
                            <img src="../img/logo.png" alt="logo" />
                        </a>
                        <div class="card-header-text" set-lan="html:We are the future of gaming" style="font-size: 16pt;">We are the future of gaming</div>
                    </div>
                    <div class="card-body">
                        <div class="card-body-holder">
                            <div class="form-group row mb-2">
                                <div class="col-12">
                                    <div class="md-form md-outline">
                                        <input type="text" id="username" class="form-control form-control-lg mb-0" autocomplete="off" onkeypress="clsAlphaNoOnly(event)" maxlength="30" />
                                        <label for="username" class="label" set-lan="html:Username">Username</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row mb-3">
                                <div class="col-12">
                                    <div class="md-form md-outline">
                                        <input type="password" id="password" class="form-control form-control-lg mb-0" autocomplete="off" maxlength="24" />
                                        <label for="password" class="label" set-lan="html:Password">Password</label>
                                        <span toggle="#password" class="toggle-password field-icon"><i class="far fa-eye"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mb-2" style="display: flex; text-align: center; align-items: center; justify-content: center;">
                                <div class="captcha">
                                    <img id="imgCaptcha" style="width: 200px; padding-top: 10px;">
                                </div>
                                <a onclick="captcha()" style="padding-left: 10px;"><i class="fas fa-redo" style="margin: auto; padding: 5px; background-color: #fff; border-radius: 11px;"></i></a>
                            </div>
                            <div class="form-group mb-3" style="width: 223px; padding-left: 12px;">
                                <div class="md-form md-outline">
                                    <input type="text" id="captcha" class="form-control form-control-lg mb-0" autocomplete="off" style="text-align: center; width: 223px;" placeholder="Captcha" />
                                    <%--<label for="captcha" class="label" set-lan="html:Captcha">Captcha</label>--%>
                                </div>
                            </div>
                            <div class="form-group row mb-4">
                                <div class="col-12">
                                    <button class="btn btn-lg btn-yellow font-weight-bold btn-block" onclick="Login()" id="btnSignIn" type="button" set-lan="text:Sign in">Sign in</button>
                                </div>
                            </div>
                            <div class="note-text white-text text-center">
                                <span style="font-size: 9pt;" set-lan="html:Contact your associate in case you forgot the password or unable to sign in">Contact your associate in case you forgot the password or unable to sign in</span>
                            </div>
                        </div>
                    </div>
                </div>
                <%----%>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="modalAlert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body mx-3 text-center">
                        <label id="lbAlert"></label>
                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalLanguage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document" style="max-width: 250px !important;">
                <div class="modal-content" style="background-color: #66667A;">
                    <div class="modal-body mx-3 text-center">
                        <a onclick="SetLanguage('Thai');">
                            <div class="row">
                                <div class="col-md-10" style="color: #fff; text-align: right;">ไทย</div>
                                <div class="col-md-2">
                                    <img src="img/Flag/thailand.png" style="width: 27px;" />
                                </div>
                            </div>
                        </a>
                        <a onclick="SetLanguage('English');">
                            <div class="row" style="margin-top: .3rem;">
                                <div class="col-md-10" style="color: #fff; text-align: right;">English</div>
                                <div class="col-md-2">
                                    <img src="img/Flag/usa.png" style="width: 27px;" />
                                </div>
                            </div>
                        </a>
                        <a onclick="SetLanguage('Chinese');">
                            <div class="row" style="margin-top: .3rem;">
                                <div class="col-md-10" style="color: #fff; text-align: right;">中文</div>
                                <div class="col-md-2">
                                    <img src="img/Flag/china.png" style="width: 27px;" />
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="../js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <!-- <script type="text/javascript" src="js/bootstrap.min.js"></script>-->
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="../js/mdb.min.js"></script>
    <!-- ACE core JavaScript -->
    <script type="text/javascript" src="../js/ace.min.js"></script>
    <!-- Language core JavaScript -->
    <script type="text/javascript" src="../js/language_Login.js"></script>
    <script type="text/javascript">
        var ipAddress;
        var apiURL = "https://ap-southeast-api.aghippo168.com";
        var logLan = "English";
        var uuid = "";
        $(document).ready(function () {
            //carnival();
            captcha();

            $('body').on('keyup', function (evt) {
                if (evt.keyCode == 13) {
                    $('#btnSignIn').click();
                }
            });

            $.getJSON("https://jsonip.com?callback=?", function (data) {
                ipAddress = data.ip;
            });

            localStorage.clear();


            $('#divblock').hide();
            $('#txtLan').click(function (e) {
                e.stopPropagation();
                $('#divblock').slideToggle();
            });
            $('#divblock').click(function (e) {
                e.stopPropagation();
            });
            $(document).click(function () {
                $('#divblock').slideUp();
            });

            var txtLan = agentLang();
            SetLan(txtLan);
            if (txtLan == "Thai") {
                $("#txtLan").html("ไทย<img src='img/Flag/thailand.png' style='width: 20px; margin-left: .4rem;' />");
            }
            else if (txtLan == "English") {
                $("#txtLan").html("English<img src='img/Flag/usa.png' style='width: 20px; margin-left: .4rem;' />");
            }
            else if (txtLan == "Chinese") {
                $("#txtLan").html("中文<img src='img/Flag/china.png' style='width: 20px; margin-left: .4rem;' />");
            }

            logLan = txtLan;
        });

        function carnival() {
            'use strict'

            const canvas = document.querySelector('canvas')
            const ctx = canvas.getContext('2d')

            let width, height, lastNow
            let snowflakes
            const maxSnowflakes = 100

            function init() {
                snowflakes = []
                resize()
                render(lastNow = performance.now())
            }

            function render(now) {
                requestAnimationFrame(render)
  
                const elapsed = now - lastNow
                lastNow = now
  
                ctx.clearRect(0, 0, width, height)
                if (snowflakes.length < maxSnowflakes)
                    snowflakes.push(new Snowflake())
  
                ctx.fillStyle = ctx.strokeStyle = '#fff'

                snowflakes.forEach(snowflake => snowflake.update(elapsed, now))
            }

            function pause() {
                cancelAnimationFrame(render)
            }
            function resume() {
                lastNow = performance.now()
                requestAnimationFrame(render)
            }


            class Snowflake {
                constructor() {
                    this.spawn()
                }
  
                spawn(anyY = false) {
                    this.x = rand(0, width)
                    this.y = anyY === true
                      ? rand(-50, height + 50)
                      : rand(-50, -10)
                    this.xVel = rand(-.05, .05)
                    this.yVel = rand(.02, .1)
                    this.angle = rand(0, Math.PI * 2)
                    this.angleVel = rand(-.001, .001)
                    this.size = rand(7, 12)
                    this.sizeOsc = rand(.01, .5)
                }
  
                    update(elapsed, now) {
                        const xForce = rand(-.001, .001);

                        if (Math.abs(this.xVel + xForce) < .075) {
                            this.xVel += xForce
                        }
    
                        this.x += this.xVel * elapsed
                        this.y += this.yVel * elapsed
                        this.angle += this.xVel * 0.05 * elapsed //this.angleVel * elapsed
    
                        if (
                          this.y - this.size > height ||
                          this.x + this.size < 0 ||
                          this.x - this.size > width
                        ) {
                            this.spawn()
                        }
    
                        this.render()
                    }
  
                    render() {
                        ctx.save()
                        const { x, y, angle, size } = this
                      ctx.beginPath()
                        ctx.arc(x, y, size * 0.2, 0, Math.PI * 2, false)
                        ctx.fill()
                        ctx.restore()
                    }
                }

                // Utils
                const rand = (min, max) => min + Math.random() * (max - min)

                    function resize() {
                        width = canvas.width = window.innerWidth
                        height = canvas.height = window.innerHeight
                    }

                    window.addEventListener('resize', resize)
                    window.addEventListener('blur', pause)
                    window.addEventListener('focus', resume)
                    init()

                }

        function agentLang() {
                    var lang = window.navigator.userLanguage || window.navigator.language;
                    lang = lang.toLowerCase();
                    var lg = "English";
                    if (lang.includes("en")) {
                        lg = "English";
                    }
                    else if (lang.includes("th") != -1) {
                        lg = "Thai";
                    }
                    else if (lang.includes("cn") != -1) {
                        lg = "Chinese";
                    }
                    else {
                        lg = "English";
                    }
                    return lg;
                }

        function ModalLanguage() {
            $("#modalLanguage").modal();
        }

        function Login() {
                    $("#myModalLoad").modal();
                    if ($('#username').val() == "") {
                        document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Username' field");
                        SetLan(logLan);
                        $('#modalAlert').modal('show');
                        $("#myModalLoad").modal('hide');
                    }
                    else if ($('#password').val() == "") {
                        document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Password' field");
                        SetLan(logLan);
                        $('#modalAlert').modal('show');
                        $("#myModalLoad").modal('hide');
                    }
                    else if ($('#captcha').val() == "") {
                        document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Captcha' field");
                        SetLan(logLan);
                        $('#modalAlert').modal('show');
                        $("#myModalLoad").modal('hide');
                    }
                    else {
                        var login = new Object();
                        login.username = $('#username').val();
                        login.password = $('#password').val();
                        login.captcha = $('#captcha').val();
                        login.uuid = uuid;
                        login.ip = ipAddress;
                        $.ajax({
                            url: apiURL + '/apiRoute/member/agentAuthen',
                            type: 'POST',
                            dataType: 'json',
                            data: login,
                            success: function (data, textStatus, xhr) {
                                if (data.code == 0 || data.code == null) {
                                    $.ajax({
                                        url: apiURL + '/apiRoute/member/profile',
                                        type: 'POST',
                                        headers: {
                                            "Authorization": data.data.accessToken,
                                            "Content-Type": "application/json"
                                        },
                                        success: function (response) {
                                            if (response.code == 0 || response.code == null) {
                                                localStorage.setItem("IP", ipAddress);
                                                localStorage.setItem("Token", data.data.accessToken);
                                                localStorage.setItem("Position", response.position);
                                                localStorage.setItem("isSupport", response.isSupport);
                                                localStorage.setItem("Language", logLan);

                                                if (response.isSupport == true) {
                                                    localStorage.setItem("Status_Account", response.accessPage.access_account);
                                                    localStorage.setItem("Status_Member", response.accessPage.access_member);
                                                    localStorage.setItem("Status_Payment", response.accessPage.access_payment);
                                                    localStorage.setItem("Status_Report", response.accessPage.access_report);
                                                    localStorage.setItem("Status_Stock", response.accessPage.access_stock);
                                                }

                                                localStorage.setItem("_ID", response._id);
                                                window.location.href = "/Menu_Dashboard/dashboard.aspx";
                                            }
                                            else {
                                                document.getElementById('lbAlert').innerHTML = response.msg;
                                                $('#modalAlert').modal('show');
                                            }

                                            $("#myModalLoad").modal('hide');
                                        },
                                        error: function (xhr, exception) {
                                            var msg = '';
                                            if (xhr.status === 0) {
                                                msg = 'Not connect. Verify Network.';
                                            } else if (xhr.status == 404) {
                                                msg = 'Requested page not found. [404]';
                                            } else if (xhr.status == 500) {
                                                msg = 'Internal Server Error [500].';
                                            } else if (exception === 'parsererror') {
                                                msg = 'Requested JSON parse failed.';
                                            } else if (exception === 'timeout') {
                                                msg = 'Time out error.';
                                            } else if (exception === 'abort') {
                                                msg = 'Ajax request aborted.';
                                            } else {
                                                msg = 'Uncaught Error.\n' + xhr.responseText;
                                            }
                                            document.getElementById('lbAlert').innerHTML = msg;
                                            $("#myModalLoad").modal('hide');
                                            $('#modalAlert').modal('show');
                                        }
                                    });
                                }
                                else if (data.code == 10001) {
                                    document.getElementById("lbAlert").setAttribute("set-lan", "text:" + data.msg + "");
                                    SetLan(logLan);
                                    $("#myModalLoad").modal('hide');
                                    $('#modalAlert').modal('show');
                                    $('#captcha').val("");
                                    captcha();
                                }
                                else if (data.code == 998) {
                                    document.getElementById("lbAlert").setAttribute("set-lan", "text:" + data.msg + "");
                                    SetLan(logLan);
                                    $("#myModalLoad").modal('hide');
                                    $('#modalAlert').modal('show');
                                    $('#captcha').val("");
                                    captcha();
                                }
                                else {
                                    document.getElementById('lbAlert').innerHTML = data.msg;
                                    $("#myModalLoad").modal('hide');
                                    $('#modalAlert').modal('show');
                                }
                            },
                            error: function (xhr, exception) {
                                var msg = '';
                                if (xhr.status === 0) {
                                    msg = 'Not connect. Verify Network.';
                                } else if (xhr.status == 404) {
                                    msg = 'Requested page not found. [404]';
                                } else if (xhr.status == 500) {
                                    msg = 'Internal Server Error [500].';
                                } else if (exception === 'parsererror') {
                                    msg = 'Requested JSON parse failed.';
                                } else if (exception === 'timeout') {
                                    msg = 'Time out error.';
                                } else if (exception === 'abort') {
                                    msg = 'Ajax request aborted.';
                                } else {
                                    msg = 'Uncaught Error.\n' + xhr.responseText;
                                }
                                document.getElementById('lbAlert').innerHTML = msg;
                                $("#myModalLoad").modal('hide');
                                $('#modalAlert').modal('show');
                            }
                        });
                    }
                }

        function captcha() {
                    $.ajax({
                        url: apiURL + '/clientSignature',
                        type: 'GET',
                        dataType: 'json',
                        success: function (data, textStatus, xhr) {
                            if (data.code == 0 || data.code == null) {
                                uuid = data.result.uuid;
                                $("#imgCaptcha").attr("src", apiURL + '/login/captcha/' + data.result.uuid);
                            }
                            else {
                                document.getElementById('lbAlert').innerHTML = data.msg;
                                $("#myModalLoad").modal('hide');
                                $('#modalAlert').modal('show');
                            }
                        },
                        error: function (xhr, exception) {
                            var msg = '';
                            if (xhr.status === 0) {
                                msg = 'Not connect. Verify Network.';
                            } else if (xhr.status == 404) {
                                msg = 'Requested page not found. [404]';
                            } else if (xhr.status == 500) {
                                msg = 'Internal Server Error [500].';
                            } else if (exception === 'parsererror') {
                                msg = 'Requested JSON parse failed.';
                            } else if (exception === 'timeout') {
                                msg = 'Time out error.';
                            } else if (exception === 'abort') {
                                msg = 'Ajax request aborted.';
                            } else {
                                msg = 'Uncaught Error.\n' + xhr.responseText;
                            }
                            document.getElementById('lbAlert').innerHTML = msg;
                            $("#myModalLoad").modal('hide');
                            $('#modalAlert').modal('show');
                        }
                    });
                }

        function ShowModal() {
                    $('#modalAlert').modal('show');
                }

        function getIPAddress() {
                    var myPeerConnection = window.RTCPeerConnection || window.mozRTCPeerConnection || window.webkitRTCPeerConnection;
                    var pc = new myPeerConnection({
                        iceServers: []
                    }),
                    noop = function () { },
                    localIPs = {},
                    ipRegex = /([0-9]{1,3}(\.[0-9]{1,3}){3}|[a-f0-9]{1,4}(:[a-f0-9]{1,4}){7})/g,
                    key;

                    function iterateIP(ip) {
                        if (!localIPs[ip]) onNewIP(ip);
                        localIPs[ip] = true;
                    }

                    pc.createDataChannel("");

                    pc.createOffer(function (sdp) {
                        sdp.sdp.split('\n').forEach(function (line) {
                            if (line.indexOf('candidate') < 0) return;
                            line.match(ipRegex).forEach(iterateIP);
                        });

                        pc.setLocalDescription(sdp, noop, noop);
                    }, noop);

                    pc.onicecandidate = function (ice) {
                        if (!ice || !ice.candidate || !ice.candidate.candidate || !ice.candidate.candidate.match(ipRegex)) return;
                        ice.candidate.candidate.match(ipRegex).forEach(iterateIP);
                    };
                }

        function SetLanguage(ele) {
                    SetLan(ele);
                    if (ele == "Thai") {
                        $("#txtLan").html("ไทย<img src='img/Flag/thailand.png' style='width: 20px; margin-left: .4rem;' />");
                    }
                    else if (ele == "English") {
                        $("#txtLan").html("English<img src='img/Flag/usa.png' style='width: 20px; margin-left: .4rem;' />");
                    }
                    else if (ele == "Chinese") {
                        $("#txtLan").html("中文<img src='img/Flag/china.png' style='width: 20px; margin-left: .4rem;' />");
                    }

                    logLan = ele;
                    $('#divblock').slideUp();
                }

        function clsAlphaNoOnly(e) {
                    var regex = new RegExp("^[a-zA-Z0-9@]+$");
                    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
                    if (regex.test(str)) {
                        return true;
                    }

                    e.preventDefault();
                    return false;
                }
    </script>
</body>
</html>
