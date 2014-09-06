<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrentSessions.aspx.cs" Inherits="SQLServerDashboard.CurrentSessions" %>

<%@ OutputCache NoStore="true" Location="None" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sessions</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" />
    <script src="js/jquery-1.11.1.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="sqlDataSource" runat="server" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
        <asp:GridView CssClass="table table-hover table-striped" ID="GridView1" runat="server" DataSourceID="sqlDataSource" EnableModelValidation="True">
            <EmptyDataTemplate>
                No session running at the moment. 
            </EmptyDataTemplate>
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <%# Convert.ToInt32(Eval("CPU_TIME")) > 3000 ? "<span class='label label-warning'>High CPU</span>" : "" %>
                        <%# Convert.ToInt32(Eval("Blocker")) > 0 ? "<span class='label label-warning'>Blocking</span>" : "" %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
<script>
    var refreshtimer = window.setTimeout(function () { window.location.reload(); }, 5000);

    document.ondblclick = function () {
        window.clearTimeout(refreshtimer);
    }


    $('tr').each(function (i, tr) {
        $('td:eq(10), td:last', tr).each(function (i, e) {
            var td = $(e);
            td.html('<div>' + td.html() + '</div>');
            td.addClass('large-cell');
            td.find('div').click(function () {
                alert($(this).text())
            });
        });
        var td = $('td:eq(9)', tr);

        td.append($('<a>')
                    .attr('href', 'http://www.sqlskills.com/blogs/paul/wait-statistics-or-please-tell-me-where-it-hurts/')
                    .attr('target', '_blank')
                    .html("?"));

    });
</script>
</html>
