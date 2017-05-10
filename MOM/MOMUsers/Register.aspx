<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MOM.Register" %>

<form id="form1" runat="server">
        <p class="text-danger">
        <asp:literal runat="server" id="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <asp:validationsummary runat="server" cssclass="text-danger" />

                <div class="form-group">
            <asp:label runat="server" associatedcontrolid="txtCPassId" cssclass="col-md-2 control-label">CPassId</asp:label>
            <div class="col-md-10">
                <asp:textbox runat="server" id="txtCPassId" cssclass="form-control"  />
                <asp:requiredfieldvalidator runat="server" controltovalidate="txtCPassId"
                    cssclass="text-danger" errormessage="The CPassId field is required." />
            </div>
        </div>
               <div class="form-group">
                            <asp:label id="Label1" runat="server" associatedcontrolid="txtUserName" cssclass="col-md-2 control-label">UserName</asp:label>
                            <div class="col-md-10">
                                <asp:textbox id="txtUserName" runat="server" cssclass="form-control"/>
                                <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" controltovalidate="txtUserName" cssclass="text-danger" errormessage="The UserName field is required." />
                            &nbsp;</div>
                        </div>
    
        <div class="form-group">
            <asp:label runat="server" associatedcontrolid="txtPassword" cssclass="col-md-2 control-label">Password</asp:label>
            <div class="col-md-10">
                <asp:textbox runat="server" id="txtPassword" textmode="Password" cssclass="form-control" />
                <asp:requiredfieldvalidator runat="server" controltovalidate="txtPassword"
                    cssclass="text-danger" errormessage="The password field is required." />
            </div>
        </div>


              <div class="form-group">
                            <asp:label id="Label2" runat="server" associatedcontrolid="txtUserFullName" cssclass="col-md-2 control-label">UserFullName</asp:label>
                            <div class="col-md-10">
                                <asp:textbox id="txtUserFullName" runat="server" cssclass="form-control"/>
                                <asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" controltovalidate="txtUserFullName" cssclass="text-danger" errormessage="The UserName field is required." />
                            &nbsp;</div>
                        </div>


            <div class="form-group">
            <asp:label runat="server" associatedcontrolid="txtEmail" cssclass="col-md-2 control-label">Email</asp:label>
            <div class="col-md-10">
                <asp:textbox runat="server" id="txtEmail" cssclass="form-control" textmode="Email" />
                <asp:requiredfieldvalidator runat="server" controltovalidate="txtEmail"
                    cssclass="text-danger" errormessage="The email field is required." />
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:button runat="server" onclick="CreateUser_Click" text="Register" cssclass="btn btn-default" />
            </div>
        </div>
    </div>



</form>

<p>
    *</p>


