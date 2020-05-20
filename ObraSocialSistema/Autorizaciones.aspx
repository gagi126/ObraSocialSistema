<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/_principal.Master" CodeBehind="Autorizaciones.aspx.vb" Inherits="ObraSocialSistema.Autorizaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron">
  <h1 class="display-4">Cambios de plan</h1>
  <p class="lead">En la siguiente grilla se listara la los socios con planes pendiente de aprobacion</p>
  <hr class="my-4">
    <table class="container-fluid">
        <tr>
            <td colspan="2"><h3></h3></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gv1" runat="server" AutoGenerateColumns="False" CssClass ="table tab-content">
                    <Columns>
                        <asp:TemplateField HeaderText="Seleccion">
                          <ItemTemplate>
                                <asp:CheckBox ID="checkaplicar" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="nro_tramite" HeaderText="Nro Tramite" />
                        <asp:BoundField DataField="apenomb" HeaderText="Apellido y Nombre" />
                        <asp:BoundField DataField="plan_actual" HeaderText="Plan Actual" />
                        <asp:BoundField DataField="plan_nuevo" HeaderText="Nuevo Plan" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        
        
        <tr>
            <td> <asp:Button ID="btnenviar" runat="server" class="btn btn-success" Text="Aplicar cambios" /></td>
        
        <td>
            <asp:Label ID="lblmensaje" runat="server" Text=""></asp:Label></td>
        </tr>
    </table>

</div>
</asp:Content>
