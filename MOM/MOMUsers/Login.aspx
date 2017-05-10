<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MOM.Login" %>


<form id="form1" runat="server">
    <div>
        <div class="row">
            <div class="col-md-8">
                <section id="loginForm">
                    <div class="form-horizontal">
                        <h4>Use a MOM account to log in.</h4>
                        <hr />
                     
                        <div class="form-group">
                            <asp:label id="Label1" runat="server" associatedcontrolid="txtUserName" cssclass="col-md-2 control-label">UserName</asp:label>
                            <div class="col-md-10">
                                <asp:textbox id="txtUserName" runat="server" cssclass="form-control"/>
                                <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" controltovalidate="txtUserName" cssclass="text-danger" errormessage="The UserName field is required." />
                            &nbsp;</div>
                        </div>
                        <div class="form-group">
                            <asp:label id="Label2" runat="server" associatedcontrolid="Password" cssclass="col-md-2 control-label">Password</asp:label>
                            <div class="col-md-10">
                                <asp:textbox id="Password" runat="server" cssclass="form-control" textmode="Password" />
                                <asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" controltovalidate="Password" cssclass="text-danger" errormessage="The password field is required." />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <div class="checkbox">
                                    <asp:checkbox id="RememberMe" runat="server" />
                                    <asp:label id="Label3" runat="server" associatedcontrolid="RememberMe">Remember me?</asp:label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:button id="Button1" runat="server" cssclass="btn btn-default" onclick="LogIn" text="Log in" />
                            </div>
                        </div>
                    </div>
                    <p>
                        <asp:hyperlink id="RegisterHyperLink" runat="server" viewstatemode="Disabled">Register as a new MOM user</asp:hyperlink>
                    </p>
                    <p>
                        <%-- Enable this once you have account confirmation enabled for password reset functionality
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                        --%>
                    </p>
                </section>
            </div>
            <%-- <div class="col-md-4">
                <section id="socialLoginForm">
                    <openauthproviders id="OpenAuthLogin" runat="server" />
                </section>
            </div>--%>
        </div>

    </div>
</form>
