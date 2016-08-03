/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


// Validates the registration form
function validateForm(elm) {
    var isValid = true;
    if (trim($('#txtFirstName').val()).length == 0) {
        showErrorMessage("#txtFirstName", "This is a required field");
        isValid = false;
    }
    else {
        clearErrorById("#txtFirstName");
    }

    if (trim($('#txtLastName').val()).length == 0) {
        showErrorMessage("#txtLastName", "This is a required field");
        isValid = false;
    }
    else {
        clearErrorById("#txtLastName");
    }

    if (trim($('#txtDob').val()).length == 0) {
        showErrorMessage("#txtDob", "This is a required field");
        isValid = false;
    }
    else {
        clearErrorById("#txtDob");
    }

    if (trim($('#txtEmail').val()).length == 0) {
        showErrorMessage("#txtEmail", "This is a required field");
        isValid = false;
    }
    else if (trim($('#txtEmail').val()).length > 0 && !validateEmail(trim($("#txtEmail").val()))) {
        showErrorMessage("#txtEmail", "Email Address is invalid");
        isValid = false;
    }
    else {
        clearErrorById("#txtEmail");
    }

    if (trim($('#txtUserName').val()).length == 0) {
        showErrorMessage("#txtUserName", "This is a required field");
        isValid = false;
    }
    else {
        clearErrorById("#txtUserName");
    }

    if (trim($('#txtPassword').val()).length == 0) {
        showErrorMessage("#txtPassword", "This is a required field");
        isValid = false;
    }
    else if (trim($('#txtPassword').val()).length > 0 && trim($('#txtPassword').val()).length < 7) {
        showErrorMessage("#txtPassword", "Minimum 7 characters");
        isValid = false;
    }
    else {
        clearErrorById("#txtPassword");
    }

    return isValid;
}

// Validates the login form
function validateLoginForm(){
    var isValid = true;
    if (trim($('#txtUsername').val()).length == 0) {
        showErrorMessage("#txtUsername", "Username cannot be empty");
        isValid = false;
    }
    else {
        clearErrorById("#txtUsername");
    }

    if (trim($('#txtPassword').val()).length == 0) {
        showErrorMessage("#txtPassword", "Password cannot be empty");
        isValid = false;
    }
    else {
        clearErrorById("#txtPassword");
    }
    
    return isValid;
}

// Validates each login control on blur event
function validateLoginFormOnLeave(elem){
    if ($('#'+elem).val().length > 0 && $('#'+elem).attr("id")=="txtUsername") {
        clearErrorById("#txtUsername");
    }
    else if ($('#'+elem).val().length == 0 && $('#'+elem).attr("id")=="txtUsername") {
        showErrorMessage("#txtUsername", "Username cannot be empty");
    }

    if ($('#'+elem).val().length > 0 && $('#'+elem).attr("id")=="txtPassword") {
        clearErrorById("#txtPassword");
    }
    else if ($('#'+elem).val().length == 0 && $('#'+elem).attr("id")=="txtPassword") {
        showErrorMessage("#txtPassword", "Password cannot be empty");
    }
    
    return false;
}

// Displays the custom validation on each inputs
function showErrorMessage(field, errMessage) {
    $(field).addClass('errorState').removeClass("normalState").attr('title', errMessage);
}

// Validates Email Address
function validateEmail($email) {
    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    if (!emailReg.test($email)) {
        return false;
    } else {
        return true;
    }
}

// Clears all the errors notations in the forms
function clearError() {
    $('.errorState').addClass('normalState').removeClass("errorState").removeAttr("title");
}

// Clears the particular ID element error state
function clearErrorById(sectionID) {
    $(sectionID).addClass('normalState').removeClass("errorState");
    $(sectionID).removeAttr("title");
}

// Javascript trim method
function trim(s) {
    var l = 0; var r = s.length - 1;
    while (l < s.length && s[l] == ' ')
    { l++; }
    while (r > l && s[r] == ' ')
    { r -= 1; }
    return s.substring(l, r + 1);
}

// Clears all the values from inputs
function clearAllValues(){
    $('input[type="text"]').val('');
    $('input[type="password"]').val('');
}
