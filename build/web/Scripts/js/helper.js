/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var extension = "../";
var isMobile = false;
var currentSelection, myNicEditor;
$(document).ready(function () {
    $(window).resize();
    performPageActions();
});

function performPageActions() {
    var page = getCurrentPage();
    var sessid = $("#sess").val();
    $(".dash-link").removeClass("active");
    if (page === "index.jsp") {
        extension = "";
        verifyUser(0);
    }
    else if (page === "profile.jsp") {
        verifyUser(1);
        ProfileFunctions(sessid);
    }
    else if (page === "dashboard.jsp") {
        verifyUser(1);
        dashboardFunctions();
    }
    General();
}

function getCurrentPage() {
//returns the current page the user is on
    var path = window.location.pathname;
    var page = path.split("/").pop();
    if (page === "" || page === "index.jsp") {
        page = "index.jsp";
        $(".indexProfile").show();
        $(".otherprofile").hide();
    } else {
        $(".indexProfile").hide();
        $(".otherprofile").show();
    }

    return page;
}

function General() {
    extension = GetExtension();
    Accordion();
    pageOptions();
//    sticky_relocate();
//    checkMobile();
    $(".show").show();
    $('textarea').val("");
    $("#datepicker").val("");
    $("input:text").val("");
    $(".hide-on-load").hide();
//    $(window).scroll(sticky_relocate);
    $(".panelClose").click(function () {
        $(this).closest(".overlay").fadeOut(500);
        $(this).closest(".overlay").addClass("hide");
    });
    $(".close_overlay").click(function () {
        $(this).closest(".overlay").fadeOut(500);
        $(this).closest(".overlay").addClass("hide");
    });
    $(".menu-item").click(function () {
        $(".menu-item").removeClass("menu-clicked");
        $(this).addClass("menu-clicked");
    });
    $(".search-btn").click(function () {
        toggleSearchPanel();
    });

    $(".panelBtn").click(function () {
        toggleReferencePanel();
    });
    $("#listview").click(function () {
        ListView();
    });
    $("#blockview").click(function () {
        BlockView();
    });
    $("#newContent").click(function () {
        window.location = extension + "index.jsp";
    });
    $("#innersearchbtn").click(function () {
        var searchtext = $("#searchtxt").val();
        filterObjects(searchtext);
    });
    $("#objectTitle").keyup(function () {
        $(this).val(capitaliseFirstLetter($(this).val()));
    });

    $(".loader").click(function () {
        $(this).addClass("hide").hide();
    });

    $("#memberRegistrationbutton").click(function () {
        alert("hello");
        CheckMemberRegistrationInputs();
    });
    $("#userLoginbutton").click(function () {
        $(".loader").removeClass("hide").show();
        var email_phone = $("#emailad").val();
        var password = $("#loginPass").val();
        UserLogin(email_phone, password);
    });
    $(".userLogoutbutton").click(function () {
        if (confirm("Are you sure you wish to Sign Out?")) {
            window.location = extension + "ControllerServlet?action=Link&type=Logout";
        }
    });

    $("#fbRegister").click(function () {
        $(".loader").removeClass("hide").show();
        $(".mfp-close").click();
        OauthRegistration("facebook");
    });

    $("#InRegister").click(function () {
        $(".loader").removeClass("hide").show();
        $(".mfp-close").click();
        OauthRegistration("linkedin2");
    });

    $("#fbLogin").click(function () {
        $(".loader").removeClass("hide").show();
        $(".mfp-close").click();
        OauthLogin("facebook");
    });

    $("#InLogin").click(function () {
        $(".loader").removeClass("hide").show();
        $(".mfp-close").click();
        OauthLogin("linkedin2");
    });

    $(".txt-pass").keypress(function (event) {
        var keycode = (event.keyCode ? event.keyCode : event.which);
        if (keycode == '13') {
            $("#userLoginbutton").click();
        }
    });

    $.magnificPopup.instance.close = function () {
        $(".txt-clear").val('');
        $.magnificPopup.proto.close.call(this);
    };

    $(".cleartxt").click(function () {
        $(".txt-clear").val('');
    });

    $(".forgot-password").click(function () {
        $("#forgotPassword").removeClass("hide").show();
        $("#mainLogin").addClass("hide").hide();
    });

    $("#loginShow").click(function () {
        $("#mainLogin").removeClass("hide").show();
        $("#forgotPassword").addClass("hide").hide();
    });

    $("#requestResetbutton").click(function () {
        var resetEmail = $("#resetemail").val();
        if (resetEmail.length < 1) {
            CustomAlert("please enter your account email", "info");
        } else {
            $(".loader").removeClass("hide").show();
            GetData("User", "ResetPasswordRequest", "ResetPasswordRequestResponse", resetEmail);
        }
    });

    $("#ChangePasswordbutton").click(function () {
        var userId = $("#userId").val();
        var password = $("#resetPassword").val();
        var vPassword = $("#verifyResetPassword").val();
        if (password.length < 1 || vPassword.length < 1) {
            CustomAlert("please enter all details", "info");
        }
        else if (password !== vPassword) {
            CustomAlert("passwords not matched", "warning");
        } else {
            var data = [userId, password];
            $(".loader").removeClass("hide").show();
            GetData("User", "ResetPassword", "ResetPasswordResponse", data);
        }
    });
}

function verifyUser(code) {
//This function checks if a user is signed in and responds     
    var sessid = $("#sess").val();
    if (sessid === "null" || sessid === "") {
        $(".user-signed-in").addClass("hide").hide();
        $(".user-guest").removeClass("hide").show();
        if (code === 1)
            window.location = extension + "ControllerServlet?action=Link&type=Logout";
    } else {
        $(".user-signed-in").removeClass("hide").show();
        $(".user-guest").addClass("hide").hide();
    }
}

function Accordion() {
    $(".accordion-content").hide();
    $("<i />", {class: "icon-arrow-up12 half-marginright arrow-up"}).prependTo(".accordion-handler").hide();
    $("<i />", {class: "icon-arrow-down12 half-marginright arrow-down"}).prependTo(".accordion-handler");
    $(".accordion-expanded").show();
    $(".accordion-expanded").closest(".accordion-parent").find(".arrow-up").toggle();
    $(".accordion-expanded").closest(".accordion-parent").find(".arrow-down").toggle();
    $(".accordion-handler").click(function () {
        $(this).closest(".accordion-parent").children(".accordion-content").slideToggle(500);
        $(this).children(".arrow-up").toggle();
        $(this).children(".arrow-down").toggle();
    });
}
function GetData(action, type, callfunction, data) {
    $(".loader").removeClass("hide").show();
    extension = GetExtension();
    $.ajax({
        url: extension + 'ControllerServlet',
        type: 'GET',
        data: {
            action: action,
            type: type,
            data: data
        },
        success: function (data) {
            $(".txt-clear").val('');
            if (data === "failed") {
                CustomAlert("Something went wrong, Please try again later ", "error");
            } else if (data === "offline") {
                CustomAlert("Your session has expired. Please log in again", "error");
                window.location = extension + "ControllerServlet?action=Link&type=Logout";
            } else {
                linkToFunction(callfunction, data);
            }
            $(".loader").addClass("hide").hide();
        },
        error: function (jqXHR, textStatus, errorThrown) {
            $(".loader").addClass("hide").hide();
//            alert("Error " + errorThrown);
            CustomAlert("Something went wrong, Please check your connection ", "error");
        }
    });
}
function imageExists(image_url) {

    var http = new XMLHttpRequest();

    http.open('HEAD', image_url, false);
    http.send();

    return http.status != 404;

}
function transferTileData(tile) {
    var dat = $(tile).find('.data1').text();
    $(tile).find(".item1").text(dat);
    $(tile).find('.edit1').val(dat);
    var dat = $(tile).find('.data2').text();
    $(tile).find(".item2").text(dat);
    $(tile).find('.edit2').val(dat);
    var dat = $(tile).find('.data3').text();
    $(tile).find(".item3").text(dat);
    $(tile).find('.edit3').val(dat);
    var dat = $(tile).find('.data4').text();
    $(tile).find(".item4").text(dat);
    $(tile).find('.edit4').val(dat);
    var dat = $(tile).find('.data5').text();
    $(tile).find(".item5").text(dat);
    $(tile).find('.edit5').val(dat);
    var dat = $(tile).find('.data6').text();
    $(tile).find(".item6").text(dat);
    $(tile).find('.edit6').val(dat);
    var dat = $(tile).find('.data7').text();
    $(tile).find(".item7").text(dat);
    $(tile).find('.edit7').val(dat);
    var dat = $(tile).find('.data8').text();
    $(tile).find(".item8").text(dat);
    $(tile).find('.edit8').val(dat);
    var dat = $(tile).find('.data9').text();
    $(tile).find(".item9").text(dat);
    $(tile).find('.edit9').val(dat);
}
function pageOptions() {
    $(".pageoptionLink").click(function () {
        var i = $(this).find(".link-num").text();
        $(".pageoption").addClass("hide");
        $(".pageoption").hide();
        $(".pageoption" + i).toggleClass("hide");
//        $(".pageoptionLink").removeClass("optionSelected");
//        $(".pageoption1Link").addClass("optionSelected");
        $(".pageoption" + i).fadeToggle(500);
    });
}
function mobileOptions() {
    $(".mobileoption1Link").click(function () {
        $(".mobileoption").addClass("hide");
        $(".mobileoption").hide();
        $(".mobileoption1").removeClass("hide");
        $(".mobileoption1").fadeIn(500);
    });
    $(".mobileoption2Link").click(function () {
        $(".mobileoption").addClass("hide");
        $(".mobileoption").hide();
        $(".mobileoption2").removeClass("hide");
        $(".mobileoption2").fadeIn(500);
    });
    $(".mobileoption3Link").click(function () {
        $(".mobileoption").addClass("hide");
        $(".mobileoption").hide();
        $(".mobileoption3").removeClass("hide");
        $(".mobileoption3").fadeIn(500);
    });
    $(".mobileoption4Link").click(function () {
        $(".mobileoption").addClass("hide");
        $(".mobileoption").hide();
        $(".mobileoption4").removeClass("hide");
        $(".mobileoption4").fadeIn(500);
    });
    $(".mobileoption5Link").click(function () {
        $(".mobileoption").addClass("hide");
        $(".mobileoption").hide();
        $(".mobileoption5").removeClass("hide");
        $(".mobileoption5").fadeIn(500);
    });
    $(".mobile-close").click(function () {
        $(this).closest(".mobile-menu").fadeOut(500);
        $(this).closest(".mobile-menu").addClass("hide");
    });
}
function sticky_relocate() {
    var window_top = $(window).scrollTop();
    var div_top = $('#sticky-anchor').offset().top;
    if (window_top > div_top) {
        $("#stick").css("position", "fixed");
        $('#stick').addClass('stick');
    } else {
        $("#stick").css("position", "relative");
        $('#stick').removeClass('stick');
    }
}
function toggleSearchPanel() {
    $(".searchPanel").removeClass("hide");
    $(".searchPanel").toggle(500);
    $("#searchtxt").focus();
}
function closeSearchPanel() {
    $(".searchPanel").removeClass("hide");
    $(".searchPanel").hide(500);
}
function openReferencePanel() {
    $(".refsPanel").removeClass("hide-refs");
    $("#contentList").removeClass("widenright");
    $(".rightTitle").removeClass("widen");
    $("#bookView").removeClass("widenbook");
    $(".righticon").show();
    $(".lefticon").hide();
}
function closeReferencePanel() {
    $(".refsPanel").addClass("hide-refs");
    $("#contentList").addClass("widenright");
    $(".rightTitle").addClass("widen");
    $("#bookView").addClass("widenbook");
    $(".righticon").hide();
    $(".lefticon").show();
}
function toggleReferencePanel() {
    $(".refsPanel").toggleClass("hide-refs");
    $("#contentList").toggleClass("widenright");
    $(".rightTitle").toggleClass("widen");
    $("#bookView").toggleClass("widenbook");
    $(".lefticon, .righticon").toggle();
}
function filterObjects(searchtext) {
    $("body").removeHighlight();
    if (searchtext.trim() !== "") {
        var searchObjs = $(".searchObject");
        var match = $('.searchObject:contains("' + searchtext + '")');
        if (match.text().trim()) {
            searchObjs.hide();
            match.closest(".searchObject").show();
            $(".searchObject").highlight(searchtext);
        } else {
            $(".searchObject").show();
        }
    } else {
        $(".searchObject").show();
    }
}
function checkMobile() {
    isMobile = false;
    if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent)
            || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0, 4)))
    {
        if (screen.width < 600) {
            $(".not-for-mobile").hide();
            $(".mobile-show").removeClass("hide");
            $(".mobile-show").show();
            mobileOptions();
        }
        isMobile = true;
//        toggleSidebar();
    } else {
        tooltip();
    }
}
function getIsMobile() {
    return isMobile;
}
function tooltip() {
    $(".tooltipParent").mouseenter(function () {
        $(this).children(".tooltip").removeClass("hide");
        $(this).children(".tooltip").show();
    });
    $(".tooltipParent").mouseleave(function () {
        $(this).children(".tooltip").addClass("hide");
        $(this).children(".tooltip").hide();
    });
}
function ListView() {
    $("#content").addClass("listview");
    openReferencePanel();
    $(".panelBtn").hide();
}
function BlockView() {
    $("#content").removeClass("listview");
    closeReferencePanel();
    $(".panelBtn").show();
}
function CustomAlert(message, type) {
    $(".loader").addClass("hide").hide();
//    alert(message);
    if (type === "success") {
        swal("Great!", message, "success");
    } else if (type === "info") {
        swal("Incomplete!", message, "info");
    } else if (type === "error") {
        swal("Sorry!", message, "error");
    } else if (type === "warning") {
        swal("Careful there!", message, "warning");
    }
}
function ConfirmLogout() {
    swal({
        title: 'Are you sure?',
        text: "You will be Signed out !",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, Sign me out!'
    }).then(function () {
        window.location = extension + "ControllerServlet?action=Link&type=Logout";
        swal(
                'Signed Out!',
                'You have been signed out.',
                'success'
                );
    });
}
function GetExtension() {
    return extension;
}
function GetCurrentSelection() {
    return currentSelection;
}
function showCustomLoader(loaderText) {
    $(".bottom-loader").text(loaderText);
    $(".bottom-loader").show();
}
function hideCustomLoader() {
    $(".bottom-loader").text("");
    $(".bottom-loader").hide();
}
function capitaliseFirstLetter(text) {
    if (text !== undefined) {
        return text.replace(/\w\S*/g, function (txt) {
            return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
        });
    }
}
function getEditor() {
    return myNicEditor;
}
function placeholder(container, text) {
    $(container).text(text);
    $(container).addClass("ashtext");
    $(container).focusin(function () {
        var current_text = $(container).text();
        if (current_text === text) {
            $(container).text("");
            $(container).removeClass("ashtext");
        }
    });
    $(container).focusout(function () {
        var current_text = $(container).text();
        if (current_text === "") {
            $(container).text(text);
            $(container).addClass("ashtext");
        }
    });
}
function CustomAutoComplete(data, textbox) {
    var parent = $("<div />", {class: "parts autoCompleteParent"}).wrap(textbox);
    var result = $("<div />", {class: "autoCompleteContainer wide white border lightborder"}).appendTo(parent);
    textbox.keyup(function () {
        var text = textbox.val().trim();
        parent.find(".autoCompleteContainer").show();
        parent.find(".autoCompleteContainer").empty();
        if (text !== "") {
            $.each(data, function (index, item) {
                if (item.toLowerCase().startsWith(text)) {
//                if (item.toLowerCase().indexOf(text) >= 0) {
                    $("<div />", {class: "mini-padding-vertical whitebtn half-padding-horizontal textleft", text: item, click: function () {
                            textbox.val(item);
                            parent.find(".autoCompleteContainer").empty();
                            parent.find(".autoCompleteContainer").hide();
                            triggerSearch();
                        }}).appendTo(result);
                }
            });
        }
    });
    $(document).mouseup(function (e) {
        if (e.target.class !== 'autoCompleteContainer' && !$('.autoCompleteContainer').find(e.target).length) {
            parent.find(".autoCompleteContainer").empty();
            parent.find(".autoCompleteContainer").hide();
        }
    });
}
function PriceFormat(price) {
    var formatter = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'NGN',
        minimumFractionDigits: 2
    });
    price = formatter.format(price);
    price = price.replace("NGN", "₦");
    return price.replace(".00", "");
}
function NumberFormat(value) {
    return value
            .replace(/\D/g, "")
            .replace(/\B(?=(\d{3})+(?!\d))/g, ",")
            ;
}
function cleanArray(actual) {
    var newArray = new Array();
    for (var i = 0; i < actual.length; i++) {
        if (actual[i]) {
            newArray.push(actual[i]);
        }
    }
    return newArray;
}
function removeItemFromArray(arr, what) {
    var a = arguments, L = a.length, ax;
    while (L > 1 && arr.length) {
        what = a[--L];
        while ((ax = arr.indexOf(what)) !== -1) {
            arr.splice(ax, 1);
        }
    }
    return arr;
}
function hasNumber(myString) {
    return /\d/.test(myString);
}
function checkEmail(email) {
    var
            sQtext = '[^\\x0d\\x22\\x5c\\x80-\\xff]',
            sDtext = '[^\\x0d\\x5b-\\x5d\\x80-\\xff]',
            sAtom = '[^\\x00-\\x20\\x22\\x28\\x29\\x2c\\x2e\\x3a-\\x3c\\x3e\\x40\\x5b-\\x5d\\x7f-\\xff]+',
            sQuotedPair = '\\x5c[\\x00-\\x7f]',
            sDomainLiteral = '\\x5b(' + sDtext + '|' + sQuotedPair + ')*\\x5d',
            sQuotedString = '\\x22(' + sQtext + '|' + sQuotedPair + ')*\\x22',
            sDomain_ref = sAtom,
            sSubDomain = '(' + sDomain_ref + '|' + sDomainLiteral + ')',
            sWord = '(' + sAtom + '|' + sQuotedString + ')',
            sDomain = sSubDomain + '(\\x2e' + sSubDomain + ')*',
            sLocalPart = sWord + '(\\x2e' + sWord + ')*',
            sAddrSpec = sLocalPart + '\\x40' + sDomain, // complete RFC822 email address spec
            sValidEmail = '^' + sAddrSpec + '$'; // as whole string

    return new RegExp(sValidEmail).test(email);
}
function DropifyScript() {
    $('.dropify').dropify({
        messages: {
            'default': 'Drag and drop a file here or click to select',
            'replace': 'Drag and drop or click to replace file',
            'remove': 'Remove file',
            'error': 'Ooops, something wrong was appended.'
        },
        error: {
            'fileSize': 'The file size is too big.'
        }
    });
}
function pop(element) {
    $(element).magnificPopup({
        type: 'inline',
        fixedContentPos: false,
        fixedBgPos: true,
        overflowY: 'auto',
        closeBtnInside: true,
        preloader: false,
        midClick: true,
        removalDelay: 300,
        mainClass: 'my-mfp-zoom-in'
    });
}

//---------------------------------------------------OAuth functions-----------------------------------------//
function OauthRegistration(provider) {

    OAuth.popup(provider)
            .done(function (result) {
                result.me()
                        .done(function (response) {
                            registerWithOauthData(response.firstname, response.lastname, response.email);
                        })
                        .fail(function (err) {
                            //handle error with err
                            console.log(err);
                            CustomAlert(err, "error");
                        });
            })
            .fail(function (err) {
                //handle error with err
                console.log(err);
                CustomAlert(err, "error");
            });
}
function OauthLogin(provider) {

    OAuth.popup(provider)
            .done(function (result) {
                result.me()
                        .done(function (response) {
                            loginWithOauthData(response.email);
                        })
                        .fail(function (err) {
                            //handle error with err
                            console.log(err);
                            CustomAlert(err, "error");
                        });
            })
            .fail(function (err) {
                //handle error with err
                console.log(err);
                CustomAlert(err, "error");
            });
}

function registerWithOauthData(firstName, lastName, email) {
    if (firstName, lastName, email) {
        memberSocialRegistration(firstName, lastName, email);
    } else {
        CustomAlert("Please provide your complete details", "warning");
    }
}
function loginWithOauthData(email) {
    $(".loader").removeClass("hide").show();
    if (email) {
        SocialLogin(email);
    } else {
        $(".loader").addClass("hide").hide();
        CustomAlert("This email address is invalid", "error");
    }
}
//---------------------------------------------------OAuth functions-----------------------------------------//

//---------------------------------------------------Login-----------------------------------------//
function UserLogin(email_phone, password) {
//    $(".loader").removeClass("hide").show();
    $.ajax({
        url: extension + "UserServlet",
        type: 'GET',
        data: {
            type: "Login",
            email_phone: email_phone,
            password: password
        },
        success: function (data) {
//            $(".overlay").hide();
            if (data[0] === "success") {
                $(".mfp-close").click();
                CustomAlert("Login Successful!", "success");
                window.location = extension + "ControllerServlet?action=Link&type=Dashboard";
            } else {
                CustomAlert(data, "error");
            }
//            $(".loader").addClass("hide").hide();
        },
        error: function (error) {
            $(".loader").addClass("hide").hide();
            CustomAlert("Login failed", "error");
            window.location.reload();
        }
    });
}
function SocialLogin(email) {
    $(".loader").removeClass("hide").show();
    $.ajax({
        url: extension + "UserServlet",
        type: 'GET',
        data: {
            type: "SocialLogin",
            email: email
        },
        success: function (data) {
//            $(".overlay").hide();
            if (data[0] === "success") {
                CustomAlert("Login Successful", "success");
                window.location = extension + "ControllerServlet?action=Link&type=Dashboard";
            } else {
                CustomAlert("Couldn't Log In!", "error");
            }
            $(".loader").addClass("hide").hide();
        },
        error: function (error) {
            CustomAlert("Login failed", "error");
            window.location.reload();
        }
    });
}
//---------------------------------------------------Login-----------------------------------------//

//---------------------------Registration---------------------------//code c
function CheckMemberRegistrationInputs() {
    $(".loader").removeClass("hide").show();
    var firstname = $("#fnam").val();
    var lastname = $("#lnam").val();
    var phonenumber = $("#phonenumber").val();
    var phoneno = /^\d{11}$/;
    var password = $("#password").val();
//    alert(team);
    var emailaddress = $("#email").val();
    var confirmpassword = $("#confirmpassword").val();
    if (firstname === "First Name" || firstname === "") {
        CustomAlert("Please provide your First Name", "info");
    }
    else if (lastname === "Last Name" || lastname === "") {
        CustomAlert("Please provide your Last Name", "info");
    }
    else if (hasNumber(lastname)) {
        CustomAlert("Your Last Name should not have a number", "info");
    }
    else if (hasNumber(firstname)) {
        CustomAlert("Your First Name should not have a number", "info");
    }
    else if (phonenumber === "Phone Number" || phonenumber === "") {
        CustomAlert("Please Enter Valid 11 Digit Number", "info");
    }
    else if (emailaddress === "Email Address" || emailaddress === "") {
        CustomAlert("Please enter valid Email Address", "info");
    }
    else if (!checkEmail(emailaddress)) {
        CustomAlert("Please provide a valid Email Address", "info");
    }
    else if (password === "Password" || password === "") {
        CustomAlert("Please enter valid Password", "info");
    }
    else if (confirmpassword === "Confirm Password" || confirmpassword !== password) {
        CustomAlert("Password Confirmation doesn't match", "info");
    }
    else if (!phonenumber.match(phoneno)) {
        CustomAlert("Please provide a valid Phone Number", "info");
    }
//    else if (!document.getElementById('checkbox1').checked) {
//        CustomAlert("Please accept the terms and conditions", "info");
//    }
    else {
//        alert("go through");
        memberRegistration(firstname, lastname, emailaddress, phonenumber, password);
    }
}
function memberRegistration(firstname, lastname, emailaddress, phonenumber, password) {
//    $(".loader").removeClass("hide").show();
    $.ajax({
        url: extension + "UserServlet",
        type: 'GET',
        data: {
            type: "MemberRegistration",
            firstname: firstname,
            lastname: lastname,
            emailaddress: emailaddress,
            phonenumber: phonenumber,
            password: password
        },
        success: function (data) {
            if (data[0] === "success") {
                $(".mfp-close").click();
                CustomAlert("Account created successfully", "success");
                window.location = extension + "ControllerServlet?action=Link&type=Dashboard";
            } else {
                CustomAlert(data, "error");
            }
//            $(".loader").addClass("hide").hide();
        }
    });
}
function memberSocialRegistration(firstname, lastname, emailaddress) {
    $(".loader").removeClass("hide").show();
    $.ajax({
        url: extension + "UserServlet",
        type: 'GET',
        data: {
            type: "MemberSocialRegistration",
            firstname: firstname,
            lastname: lastname,
            emailaddress: emailaddress
        },
        success: function (data) {
            if (data[0] === "success") {
                CustomAlert("Account created successfully,please check email to activate your account", "success");
//                UserLogin(emailaddress, password);
//                window.location = extension + "ControllerServlet?action=Link&type=Dashboard";
            } else {
                CustomAlert("Account already exists, kindly click on the Login in Button", "error");
            }
            $(".loader").addClass("hide").hide();
        }
    });
}

//---------------------------Registration----------------------------//

