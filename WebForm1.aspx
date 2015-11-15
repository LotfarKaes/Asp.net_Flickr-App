<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ContribeSpaFlickr.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Contribe-Flickr </title>
</head>
<body background="lk.jpg">
    <form id="form1" runat="server">
    <div style="text-align: center">
        <center>
            
            <br />
            <br /><asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="16pt" ForeColor="#0066CC"
                Text="My Picture Srvice Flickr App"></asp:Label>
            <table cellpadding="5" cellspacing="0" style="border: 2px solid #0066CC; width: 60%;">
                <tr>
                    <td style="width: 40%;">
                        
                        <asp:Label ID="Label2" runat="server" Text=" Search:" Font-Bold="True" 
                            ForeColor="#006600"></asp:Label>
                       
                        <asp:TextBox ID="SearchTextBox" runat="server" BackColor="Silver" 
                            BorderColor="#009900" Height="24px" Width="132px"></asp:TextBox>
                        &nbsp;<asp:Button ID="GoButton" runat="server" Text="HIT" 
                            OnClick="HITButton_Click" BackColor="#CC3300" Font-Bold="True" 
                            Font-Italic="True" Font-Overline="False" ForeColor="#0033CC" Height="30px" 
                            Width="58px" />
                    </td>
                    <td style="vertical-align: top">
                        <asp:Label ID="PhotoDateTaken" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top">
                       <div>
                        <asp:DataList ID="ThumbnailsList" runat="server" HorizontalAlign="Center" RepeatColumns="3"
                            Width="100%" OnSelectedIndexChanged="ThumbnailsList_SelectedIndexChanged">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:ImageButton ID="ThumbnailImage" runat="server" ImageUrl='<%# Eval("SquareThumbnailUrl") %>'
                                    AlternateText='<%# Eval("Title") %>' ToolTip='<%# Eval("Title") %>' CommandName="Select">
                                </asp:ImageButton>
                                <asp:Literal ID="HiddenPhotoId" runat="server" Text='<%# Eval("PhotoId") %>' Visible="false" />
                                <asp:Literal ID="HiddenPhotoUrl" runat="server" Text='<%# Eval("MediumUrl") %>' Visible="false" />
                            </ItemTemplate>
                        </asp:DataList>
                        </div>
                    </td>
                    <td style="vertical-align: top">
                        <asp:Image ID="PreviewImage" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top">
                        &nbsp;
                    </td>
                    <td style="vertical-align: top">
                        <asp:Label ID="PhotoDescription" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </center>
    </div>
    </form>
</body>
</html>
