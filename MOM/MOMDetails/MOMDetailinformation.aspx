<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MOMDetailinformation.aspx.cs" Inherits="MOM.MOMDetails.MOMDetailInformation" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>

<head runat="server">
        <script src="../Scripts/jquery-3.1.1.min.js"></script>
<script src="../Scripts/jquery-3.1.1.js"></script>
    <title></title>
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
    </style>


    <script type="text/javascript">
    function ShowPopup(message) {
        $(function () {
            $("#dialog").html(message);
            $("#dialog").dialog({
                title: "MOMDetailInformationMessage",
                buttons: {
                    Close: function () {
                        $(this).dialog('close');
                    }
                },
                modal: true
            });
        });
    };
</script>




</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 396px; vertical-align: central">

            <table class="style1">
                <tr>
                    <td class="style16" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <strong><span class="style3"><span class="style13">MOM USer Information</span>&nbsp;</span></strong></td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style6">
                        <strong>CpassId</strong></td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="style14">
                                    <asp:TextBox ID="txtCPassId" runat="server" Width="195px"></asp:TextBox>
                                    <asp:Label ID="Label1" runat="server" Text="*"></asp:Label>
                                    &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="txtCPassId" ErrorMessage="CpassId can not be Blank"
                                    Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td  class="style6">
                        <strong>UserFunctionalArea</strong></td>
                    <td class="style14">
                        <asp:DropDownList ID="ddlFunctionalArea" runat="server" Width="195px" OnSelectedIndexChanged="ddlFunctionalArea_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="ddlFunctionalArea" ErrorMessage="UserFunctionalArea should not be Blank"
                            Font-Bold="True" Font-Size="Medium" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style7">
                        <strong>UserApplicationName</strong></td>
                    <td class="style15">
                        <asp:DropDownList ID="ddlApplicatonName" runat="server" Width="195px" AppendDataBoundItems="true">
                            <asp:ListItem Text="Legal"></asp:ListItem>
                        </asp:DropDownList>

                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                            ControlToValidate="ddlApplicatonName" ErrorMessage="UserApplicationName can not be Blank"
                            Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="style8">
                        <strong>MOM StartDate</strong></td>
                    <td class="style4">
                        <asp:TextBox ID="txtMOMStartDate" runat="server" Width="195px"></asp:TextBox>
                        <ajax:CalendarExtender ID="CalendarExtender1" TargetControlID="txtMOMStartDate" Format="dd/MM/yyyy" runat="server"></ajax:CalendarExtender>
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="txtMOMStartDate" ErrorMessage="MOM StartDate can not be Blank"
                            Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="style8">
                        <strong>MOM EndDate</strong></td>
                    <td class="style4">
                        <asp:TextBox ID="txtMOMEndDate" runat="server" Width="195px"></asp:TextBox>
                        <ajax:CalendarExtender ID="CalendarExtender2" TargetControlID="txtMOMEndDate" Format="dd/MM/yyyy" runat="server"></ajax:CalendarExtender>

                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                            ControlToValidate="txtMOMEndDate" ErrorMessage="MOM EndDate can not be Blank"
                            Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="style6">
                        <strong>Type of MOM</strong></td>
                    <td class="style14">
                        <asp:TextBox ID="txtTypeOfMOM" runat="server" Width="195px"></asp:TextBox>
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="txtTypeOfMOM" ErrorMessage="Type of MOM Cannot be Blank"
                            Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>


                <tr>
                    <td class="style6">
                        <strong>MOM Organiser</strong></td>
                    <td class="style14">
                        <asp:TextBox ID="txtMOMOrganiser" runat="server" Width="195px"></asp:TextBox>
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                            ControlToValidate="txtMOMOrganiser" ErrorMessage="MOM Organiser Cannot be Blank"
                            Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style11">
                        <strong>UserMominformation</strong>r</td>
                    <td class="style12">
                        <asp:TextBox ID="txtUserinformation" runat="server" MaxLength="10" Width="195px" TextMode="MultiLine"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox   Checked="false" runat="server" />
                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ControlToValidate="txtUserinformation" ErrorMessage="UserMominformation can not be Blank"
                            Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>

                        
                    </td>
                </tr>


                <tr>
                    <td class="style6">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Font-Bold="True"
                            Style="background-color: #99CCFF" Text="ADD MOMDetails" Width="153px"
                            OnClick="Button1_Click" />
                    </td>
                </tr>

                <tr>

                    <td></td>
                </tr>
                <tr>

                    <td></td>
                </tr>
            </table>
            <table id="MOMOverview1" style="width: 100%;" runat="server">
                <tr id="MOMOverview" runat="server">
                    <td class="style1">
                        <strong id="lblName" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOM Details Overview</strong></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>

                    <td></td>
                </tr>

                <tr>
                    <td>
                        <asp:GridView ID="grdMOMDetails" runat="server" AutoGenerateColumns="False"
                            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
                            CellPadding="3" AutoGenerateDeleteButton="True"
                            AutoGenerateEditButton="True"
                            CellSpacing="2">
                            <Columns>
                                <asp:TemplateField HeaderText="UserCpassId">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserCpassId") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserCpassId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
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
    </form>
</body>
</html>

