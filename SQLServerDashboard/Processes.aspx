<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Processes.aspx.cs" Inherits="SQLServerDashboard.Processes" %>
<%@ OutputCache NoStore="true" Location="None" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Processes</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" />    
    <link href="css/basic.css" rel="stylesheet" />
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/jquery.simplemodal.js"></script>
    
    <style>
        td.large-cell {
            padding: 0px;
            margin: 0px;
            table-layout:fixed;
        }

        td.large-cell div {
            height: 80px;
            overflow: auto;
            cursor: hand;
            cursor: pointer                
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">        
                <asp:SqlDataSource ID="sqlDataSource" runat="server"  ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
                <asp:GridView CssClass="table table-hover table-striped" ID="GridView1" runat="server" DataSourceID="sqlDataSource" EnableModelValidation="True">
                    <Columns>
                        <asp:TemplateField>
                            
                            <ItemTemplate>
                                <%# Convert.ToInt32(Eval("WaitTime_ms")) > 1000 ? "<span class='label label-warning'>High Wait</span>" : "" %>                                
                                <%# Convert.ToString(Eval("BlockBy")).Length > 1 ? "<span class='label label-warning'>Block</span>" : "" %>                                
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>                    
                </asp:GridView>            
    </form>

    <div id="basic-modal-content">
        <pre id="content_text" >

        </pre>
    </div>
</body>
    <script>
        var refreshtimer = window.setTimeout(function () { window.location.reload(); }, 10000);
        $('tr').each(function (i, tr) {
            var td = $('td:eq(2)', tr);
            td.html('<div>' + td.html() + '</div>');
            td.addClass('large-cell');
            td.find('div').click(function () {
                $('#content_text').text($(this).html());
                $('#basic-modal-content').modal();
            });
        });
        document.ondblclick = function () {
            window.clearTimeout(refreshtimer);
        }
    </script>
</html>
