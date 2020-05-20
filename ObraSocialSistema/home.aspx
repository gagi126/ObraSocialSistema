<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/_principal.Master" CodeBehind="home.aspx.vb" Inherits="ObraSocialSistema.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
           <div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>Consulta de socios</h1>
    <p></p>
      <form class="form-horizontal" action="/action_page.php">
  <div class="form-group">
    <label class="control-label col-sm-2" for="txtapellido">Apellido:</label>
      <asp:TextBox ID="txtapellido" class="form-control"  placeholder="Ingrese el Apellido" AutoPostBack="True" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe ingresar un apellido para realizar la busqueda" ControlToValidate="txtapellido" Display="none" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="txtnombre">Nombre:</label>
      <asp:TextBox ID="txtnombre" class="form-control"  placeholder="Ingrese el Nombre" AutoPostBack="True" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Debe ingresar un nombre para realizar la busqueda" ControlToValidate="txtnombre" Display="none" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
  </div>
  <div class="form-group">
      <asp:Button ID="btnbuscsocio" runat="server" class="btn btn-success" Text="Buscar" />
      <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" CssClass="alert alert-danger" />
  </div>
</form>
      <div class="form-group">
          </div>
  </div>
               <center>
                   <br />
               <asp:Panel runat="server" id="panelalerta">
           <asp:Label runat="server" Text="" CssClass="alert alert-danger" visible="false" ID="lblalerta"><strong>Atencion:</strong>El socio buscado no existe</asp:Label>
        </asp:Panel>
                   </center>
</div>    
        </table>
    
    <center>
    <table width="900">
    <tr>
        <td>
            <asp:GridView ID="gv1" runat="server" CssClass ="table tab-content" AutoGenerateColumns="False">
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="nro_socios" DataNavigateUrlFormatString="DetsSocio.aspx?nroSocio={0}" DataTextField="apellido" HeaderText="Socio" />
                    <asp:BoundField DataField="nro_documento" HeaderText="Documento" />
                    <asp:BoundField DataField="apenomb" HeaderText="Apellido y Nombre" />
                    <asp:BoundField DataField="fecha_nac" HeaderText="Fecha Nacimiento" />
                    <asp:BoundField DataField="sexo1" HeaderText="Sexo" />
                    <asp:BoundField DataField="nro_socio" HeaderText="Nro Socio" />
                    <asp:BoundField DataField="nro_socio_titular" HeaderText="Nro Socio Titular" />
                    <asp:BoundField DataField="par" HeaderText="Parentesco" />
                    <asp:BoundField DataField="plan_os" HeaderText="Plan Contratado" />
                    <asp:BoundField DataField="direccion" HeaderText="Direccion" />
                    <asp:BoundField DataField="cp" HeaderText="CP" />
                    <asp:BoundField DataField="telefonos" HeaderText="Telefono" />
                    <asp:BoundField DataField="mail" HeaderText="Email" />
                    <asp:BoundField DataField="est" HeaderText="Estado" />
                </Columns>

            </asp:GridView>
        </td>
    </tr>
    
  </table>
    </center>    



    </asp:Content>