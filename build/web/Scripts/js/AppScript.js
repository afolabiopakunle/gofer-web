/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var extension;
var userdata = new Array();
var countList = ["Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Anguilla", "Antigua &amp; Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas"
            , "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia &amp; Herzegovina", "Botswana", "Brazil", "British Virgin Islands"
            , "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Chad", "Chile", "China", "Colombia", "Congo", "Cook Islands", "Costa Rica"
            , "Cote D Ivoire", "Croatia", "Cruise Ship", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea"
            , "Estonia", "Ethiopia", "Falkland Islands", "Faroe Islands", "Fiji", "Finland", "France", "French Polynesia", "French West Indies", "Gabon", "Gambia", "Georgia", "Germany", "Ghana"
            , "Gibraltar", "Greece", "Greenland", "Grenada", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea Bissau", "Guyana", "Haiti", "Honduras", "Hong Kong", "Hungary", "Iceland", "India"
            , "Indonesia", "Iran", "Iraq", "Ireland", "Isle of Man", "Israel", "Italy", "Jamaica", "Japan", "Jersey", "Jordan", "Kazakhstan", "Kenya", "Kuwait", "Kyrgyz Republic", "Laos", "Latvia"
            , "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Mauritania"
            , "Mauritius", "Mexico", "Moldova", "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco", "Mozambique", "Namibia", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia"
            , "New Zealand", "Nicaragua", "Niger", "Nigeria", "Norway", "Oman", "Pakistan", "Palestine", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal"
            , "Puerto Rico", "Qatar", "Reunion", "Romania", "Russia", "Rwanda", "Saint Pierre &amp; Miquelon", "Samoa", "San Marino", "Satellite", "Saudi Arabia", "Senegal", "Serbia", "Seychelles"
            , "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "South Africa", "South Korea", "Spain", "Sri Lanka", "St Kitts &amp; Nevis", "St Lucia", "St Vincent", "St. Lucia", "Sudan"
            , "Suriname", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Timor L'Este", "Togo", "Tonga", "Trinidad &amp; Tobago", "Tunisia"
            , "Turkey", "Turkmenistan", "Turks &amp; Caicos", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay"
            , "Uzbekistan", "Venezuela", "Vietnam", "Virgin Islands (US)", "Yemen", "Zambia", "Zimbabwe"];
// Snackbar for user status switcher

function initAutocomplete() {
    var options = {
        types: ['(cities)']
                // componentRestrictions: {country: "us"}
    };

    var input = $('#autocomplete-input');
    var autocomplete = new google.maps.places.Autocomplete(input, options);
//    return autocomplete;
}

// Function Performs actions that pertain to the Current Page and get loaded on windows load
function performPageActions() {
//    verifyUser();
    var page = getCurrentPage();
    userid = $("#userid").val();
    if (page === "index.jsp") {
        extension = "../";
    } else if (page === "login.jsp") {
        extension = "../";
    }
//    checkUser();
    btnEvents();
}

// Functions for the User Profile page and other profile elements
function ProfileFunctions(sess) {

    GetData("Profile", "getUserProfile", "LoadUserProfile", sess);
}

// Function handles all button Events within the Application
function btnEvents() {
    $("form[name=loginForm]").submit(function (e) {
        var email = $("#email").val();
        var password = $("#pass").val();
        var data = [email, password];
            localStorage.Email = email;
            localStorage.Pass = password;
        GetData("User", "Login", "LoadUserLogin", data);
        e.preventDefault();
    });

    $("form[name=registerForm]").submit(function (e) {
        var firstname = $("#fname").val();
        var lastname = $("#lname").val();
        var phonenumber = $("#phone").val();
        var emailaddress = $("#email").val();
        if ($("#confirmPassword").val() !== $("#password").val()) {
            $(".chkpass").show();
            $(".chkpass").removeClass("hide");
            $("#password").val('');
            return;
        } else {
            var password = $("#password").val();
        }
        var data = [firstname, lastname, emailaddress, phonenumber, password];
        GetData("User", "MemberRegistration", "LoadRegistration", data);
        e.preventDefault();
    });
}

//function LoginFunctions() {
//    if (localStorage.chkbx && localStorage.chkbx !== '') {
//        $("#remember_me").attr('checked', 'checked');
//        $("#email").val(localStorage.Email);
//        $("#pass").val(localStorage.Pass);
//    } else {
//        $("#remember_me").removeAttr('checked');
//        $("#email").val('');
//        $("#pass").val('');
//    }
////    window.location = extension + "ControllerServlet?action=Link&type=Profile";
//    
//}

function DisplayProfileData(data) {
    extension = GetExtension();
    if (data === "empty") {
        window.location = extension + "ControllerServlet?action=Link&type=Logout";
    } else {
        $(".data-user-name").text(data["uNam"]);
        $(".pro-date-joined").text(data["dateJoined"]);
        var title = data["sp_title"];
        var desc = data["sp_description"];
        if (title !== "" && title !== "null") {
            $(".data-user-title").text(title);
            $("#txt-title").val(title);
        }
        if (desc !== "" && desc !== "null") {
            $(".data-user-description").html(desc);
            var regex = /<br\s*[\/]?>/gi;
            var editDesc = desc.replace(regex, '\n');
            $("#txt-desc").val(editDesc);
        }
        var len = $(".edit-pro-txt-desc").val().length;
        if (len >= 500) {
            $(".edit-pro-txt-desc").val($(".edit-pro-txt-desc").val().substring(0, 500));
        } else {
            $("#charNum").text(500 - len);
        }
//        DisplaySkills(data["sp_skills"]);
    }
}

function DisplayRegistration(data) {
    if (data === "success") {
        swal({
            title: "Account created",
            text: "Check your email validate and verify your account!",
            type: "success",
            showCancelButton: false,
            confirmButtonClass: 'btn btn-success',
            confirmButtonText: 'Ok!',
            onClose: function () {
                window.location = extension + "LinksServlet?type=Login";
            }
        });
    } else {
        swal({
            title: "Oops!",
            text: data,
            type: "info",
            showCancelButton: false,
            confirmButtonClass: 'btn btn-info',
            confirmButtonText: 'Retry',
            onClose: function () {
                window.location = extension + "LinksServlet?type=Login";
            }
        });
    }
}

function DisplayUserLogin(data) {
//    hideLoader();
    if (data === "Incorrect Login Details") {
        swal({
            title: "Oops!",
            text: "Incorrect Login Details, Please try again!",
            type: "info",
            showCancelButton: false,
            confirmButtonClass: 'btn btn-info',
            confirmButtonText: 'Retry',
            onClose: function () {
                window.location = extension + "ControllerServlet?action=Link&type=Login";
            }
        });
    } else if (data === "Email or Phone Number Entered Doesn't Exist") {
        swal({
            title: "Oops!",
            text: "Email or Phone Number Entered Doesn't Exist!",
            type: "info",
            showCancelButton: false,
            confirmButtonClass: 'btn btn-info',
            confirmButtonText: 'Retry',
            onClose: function () {
                window.location = extension + "ControllerServlet?action=Link&type=Login";
            }
        });
    } else if (data === "Blocked") {
        swal({
            title: "Oops!",
            text: "Your account has been Blocked, please contact Gofer Admin!",
            type: "info",
            showCancelButton: false,
            confirmButtonClass: 'btn btn-info',
            confirmButtonText: 'Ok',
            onClose: function () {
                window.location = extension + "ControllerServlet?action=Link&type=Login";
            }
        });
    } else {
        swal({
            title: "Welcome, You're logged on",
            text: "Successful login",
            type: "success",
            showCancelButton: false,
            confirmButtonText: '<i class="icon-thumbs-up2 mr-2"></i> Continue ',
            confirmButtonClass: 'btn btn-success',
            buttonsStyling: false,
            onClose: function () {
//                verifyUser();
//                window.location = extension + "LinksServlet?type=Errands";
                window.location = extension + "ControllerServlet?action=Link&type=Errands";
            }
        });
        window.location = extension + "LinksServlet?type=Errands";
    }
    
}

function GenerateDropCountries() {
    var par = $("select.country-drop");
    par.find(".newCountry").remove();
    $.each(countList, function (ind, country) {
        $("<option />", {value: country, text: country, class: "newCountry"}).appendTo(par);
    });
    par.selectpicker('refresh');
}

function linkToFunction(action, params) {
    switch (action) {
        case "LoadRegistration":
        {
            DisplayRegistration(params);
            break;
        }
        case "LoadUserLogin":
        {
            DisplayUserLogin(params);
            break;
        }
        case "LoadUserProfile":
        {
            DisplayProfileData(params);
            break;
        }
        case "ReloadProfilePage":
        {
            window.location = extension + "ControllerServlet?action=Link&type=Profile";
            break;
        }
        case "ReloadProfile":
        {
            var sess = $("#sess").val();
            GetData("Profile", "getUserProfile", "LoadUserProfile", sess);
            break;
        }
        case "ResetPasswordRequestResponse":
        {
            $(".loader").addClass("hide").hide();
            if (params[0] === "success") {
                CustomAlert("Your reset instructions has been sent, please check your email", "success");
            } else {
                CustomAlert(params[1], "error");
            }
            break;
        }
        case "ResetPasswordResponse":
        {
            $(".loader").addClass("hide").hide();
            if (params[0] === "success") {
                CustomAlert("Your password has been reset successfully, you can now log in", "success");
                window.location = extension + "ControllerServlet?action=Link&type=Home";
            } else {
                CustomAlert(params[1], "error");
            }
            break;
        }
    }
}

