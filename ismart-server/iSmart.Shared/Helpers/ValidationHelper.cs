using System;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;

public static class ValidationHelper
{
    public static bool ValidateNotEmpty(string value, out string errorMessage)
    {
        if (string.IsNullOrWhiteSpace(value))
        {
            errorMessage = "Giá trị không được để trống!";
            return false;
        }

        errorMessage = string.Empty;
        return true;
    }

    public static bool ValidateGreaterThanZero(int value, out string errorMessage)
    {
        if (!int.TryParse(value.ToString(), out _))
        {
            errorMessage = "Giá trị không hợp lệ!";
            return false;
        }

        if (value <= 0)
        {
            errorMessage = "Giá trị phải lớn hơn 0!";
            return false;
        }

        errorMessage = string.Empty;
        return true;
    }


    public static bool ValidatePhoneNumber(string phoneNumber, out string errorMessage)
    {
        var regex = new Regex(@"^\+?\d{10,15}$");
        if (!regex.IsMatch(phoneNumber))
        {
            errorMessage = "Số điện thoại không hợp lệ!";
            return false;
        }

        errorMessage = string.Empty;
        return true;
    }

    public static bool ValidateEmail(string email, out string errorMessage)
    {
        var emailAttribute = new EmailAddressAttribute();
        if (!emailAttribute.IsValid(email))
        {
            errorMessage = "Email không hợp lệ!";
            return false;
        }

        errorMessage = string.Empty;
        return true;
    }

    //public static bool ValidateDate(DateTime date, out string errorMessage)
    //{
    //    if (date == default)
    //    {
    //        errorMessage = "Ngày tháng không hợp lệ!";
    //        return false;
    //    }

    //    errorMessage = string.Empty;
    //    return true;
    //}
}
