<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mom_Admin.aspx.cs" Inherits="MOM.MOMUsers.Mom_Admin" %>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../Scripts/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {


            $("#btnShowModal").click(function (e) {

                ShowDialog(true);
                e.preventDefault();
            });

            $("#btnClose").click(function (e) {
                HideDialog();
                e.preventDefault();
            });





            function ShowDialog(modal) {

                $("#overlay").show();
                $("#dialog").fadeIn(300);

                if (modal) {
                    $("#overlay").unbind("click");
                }
                else {
                    $("#overlay").click(function (e) {

                        HideDialog();
                    });
                }
            }

            function HideDialog() {
                $("#overlay").hide();
                $("#dialog").fadeOut(300);
            }
        });

    </script>

    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            height: 6px;
        }

        .style3 {
            font-size: x-large;
            background-color: #66FFFF;
        }

        .style4 {
            height: 8px;
            text-align: left;
        }

        .style5 {
            height: 23px;
        }

        .style6 {
            width: 148px;
            text-align: left;
        }

        .style7 {
            height: 23px;
            width: 148px;
            text-align: left;
        }

        .style8 {
            height: 8px;
            width: 148px;
            text-align: left;
        }

        .style10 {
            width: 148px;
            height: 23px;
        }

        .style11 {
            width: 148px;
            text-align: left;
            height: 30px;
        }

        .style12 {
            height: 30px;
            text-align: left;
        }

        .style13 {
            text-decoration: underline;
            color: #FF33CC;
            background-color: #CCFFFF;
        }

        .style14 {
            text-align: left;
        }

        .style15 {
            height: 23px;
            text-align: left;
        }

        .style16 {
            height: 6px;
            text-align: left;
        }

        .auto-style1 {
            text-align: left;
            width: 434px;
        }


        .body {
            background-image: url('/Images/ADMIM_MOM_1 - Copy - Copy.jpg');
            width: 20px;
            height: 50px;
            background-size: 970px;
            background: no-repeat;
        }



        .auto-style2 {
            color: #8000FF;
        }

        .auto-style3 {
            width: 148px;
            text-align: left;
            color: #8000FF;
        }

        .auto-style4 {
            width: 100%;
            color: #8000FF;
        }

        .web_dialog_overlay {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            height: 100%;
            width: 100%;
            margin: 0;
            padding: 0;
            background: #000000;
            opacity: .15;
            filter: alpha(opacity=15);
            -moz-opacity: .15;
            z-index: 101;
            display: none;
        }

        .web_dialog {
            display: none;
            position: fixed;
            width: 300px;
            height: 215px;
            top: 50%;
            left: 50%;
            margin-left: -190px;
            margin-top: -100px;
            background-color: #ffffff;
            border: 2px solid #336699;
            padding: 0px;
            z-index: 102;
            font-family: Verdana;
            font-size: 10pt;
        }

        .web_dialog_title {
            border-bottom: solid 2px #336699;
            background-color: #336699;
            padding: 4px;
            color: White;
            font-weight: bold;
        }

            .web_dialog_title a {
                color: White;
                text-decoration: none;
            }

        .align_right {
            text-align: right;
        }

        .auto-style5 {
            width: 243px;
            text-align: left;
        }

        .auto-style6 {
            width: 243px;
        }
    </style>
</head>
<body style="background: url('/Images/ADMIM_MOM_1 - Copy - Copy.jpg') no-repeat; width: 100%; height: 150px; background-size: 1350px 670px;margin-left: auto;margin-right: auto;">
    <form id="form1" runat="server">
        <div>

            <table class="style1">


                <tr>


                    <td class="auto-style5">
                        <strong>Select Admin</strong></td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="ddlAdmin" runat="server" Width="195px" AutoPostBack="true" OnSelectedIndexChanged="ddlAdmin_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="0" Text="-- Select Admin --"></asp:ListItem>
                            <asp:ListItem Selected="False" Value="1" Text="Admin"></asp:ListItem>
                            <asp:ListItem Selected="False" Value="2" Text="AnandK"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style3">
                        <strong>UserCPassId</strong></td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="ddlCPassId" runat="server" Width="195px" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlCPassId_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style3">
                        <strong>UserApplicationNames</strong></td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="ddlApplicatonName" runat="server" Width="195px">
                        </asp:DropDownList>
                    </td>
                    <%--   <td class="style6">
                        <strong>UserName</strong></td>
                    <td class="style14">
                        <asp:TextBox ID="txtUserName" runat="server" Width="195px"></asp:TextBox>
                      
                    </td>--%>
                </tr>
                <tr>

                    <td class="auto-style6"></td>
                </tr>
                <tr>

                    <td class="auto-style6"></td>
                </tr>
            </table>

            <div align="center">
                <table style="width: 100%; align-content: center">
                    <tr id="MOMOverview" runat="server" style="vertical-align: central">
                        <td class="auto-style4">
                            <strong id="lblName" runat="server">MOM UserInformation Discussion Points</strong></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>

                    </tr>


                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="grdMOMUserDetails" runat="server" AutoGenerateColumns="False"
                                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
                                CellPadding="3" CellSpacing="2" EmptyDataText="Data Not Found">
                                <Columns>
                                    <asp:TemplateField HeaderText="FunctionalArea">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserfunctionalArea") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserfunctionalArea") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ApplicationName">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("UserApplicationName") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserApplicationName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="MOMStartDate">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("MOMStartDate") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("MOMStartDate") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="MOMEndDate">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("MOMEndDate") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("MOMEndDate") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TypeofMOM">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TypeofMOM") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("TypeofMOM") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="MOMOrganiser">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("MOMOrganiser") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("MOMOrganiser") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>



                                    <asp:TemplateField HeaderText="UserMominformation">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("UserMominformation") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserMominformation") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>



                                </Columns>
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                <SortedDescendingHeaderStyle BackColor="#93451F" />
                            </asp:GridView>
                        </td>

                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>


                </table>
            </div>
        </div>
    </form>
</body>
</html>
