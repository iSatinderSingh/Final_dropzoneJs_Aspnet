<%@ Page Title="Upload Images Using DropzoneJs in Asp.net C#." Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ImageUploadWithDropzoneJS.aspx.cs" Inherits="ImageUploadWithDropzoneJS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="latestJs_1.11/jquery.min.js"></script>
    <script src="DropzoneJs_scripts/dropzone.js"></script>
    <link href="DropzoneJs_scripts/dropzone.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h4>Upload image using DropzoneJS in Asp.net C#.</h4>
    <a title="For details Explanation click here" target="_blank" href="http://codepedia.info/2015/03/using-dropzone-js-file-image-upload-in-asp-net-webform-c/?github=tuts#">Click here for explaination</a>
    <br /><br />
    <div id="dZUpload" class="dropzone">
        <div class="dz-default dz-message">
            Drop image here. 
        </div>
    </div>
    <script type="text/javascript">

        $(document).ready(function () {
            console.log("Hello");
            Dropzone.autoDiscover = false;
            //Simple Dropzonejs 
            $("#dZUpload").dropzone({
                url: "hn_SimpeFileUploader.ashx",
                maxFiles: 5,
                addRemoveLinks: true,
                success: function (file, response) {
                    var imgName = response;
                    file.previewElement.classList.add("dz-success");
                    console.log("Successfully uploaded :" + imgName);
                },
                error: function (file, response) {
                    file.previewElement.classList.add("dz-error");
                }
            });
        });
    </script>
</asp:Content>

