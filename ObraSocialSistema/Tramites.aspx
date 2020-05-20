<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/_principal.Master" CodeBehind="Tramites.aspx.vb" Inherits="ObraSocialSistema.Tramites" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 19%;
            left: 138px;
            top: 194px;
            height: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }
        .auto-style2 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 95%;
            left: 302px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }
        .auto-style3 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 19%;
            padding-left: 15px;
            padding-right: 15px;
        }
        .auto-style4 {
            width: 19%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Solicitudes de cambio de plan.</h1>
    <p class="lead">Escriba el nro de socio para realizar la solicitud de cambio de plan.</p>
      <table class="table table-borderless">
          <tr>
              <td class="col-sm-4">Nro Socio Titular: </td>
              <td class="col-sm-4"><asp:TextBox class="form-control" placeholder="Socio Titular" ID="txtnrosocio" runat="server" AutoPostBack="true" Width="100px"></asp:TextBox></td>
              <td class="col-sm-4"><asp:Label ID="lblapenomb" runat="server" Text="" CssClass="badge badge-primary" Enabled="false"></asp:Label></td>
          </tr>
          <tr>
              <td class="col-sm-4">Plan Actual: </td>
              <td class="col-sm-4"><asp:Label ID="lblplanactual" runat="server" Text="" CssClass="badge badge-primary" Enabled="false"></asp:Label></td>
          </tr>
          <tr>
              <td class="col-sm-4">Nuevo Plan: </td>
              <td class="col-sm-4"><asp:DropDownList ID="cmbplanos" runat="server" CssClass="dropdown"></asp:DropDownList></td>
          </tr>
          <tr>
              <td class="col-sm-4"></td>
              <td class="col-sm-4"><asp:Button ID="btnenviar" runat="server" class="btn btn-success" Text="Enviar" /></td>
          </tr>
                    <tr>
              <td class="col-sm-4"></td>
              <td class="col-sm-4 alert alert-danger" runat="server" id="colalert" visible="false"> <asp:Label runat="server" Text="" CssClass="alert" visible="false" ID="lblerror"><strong>Atencion:</strong></asp:Label></td>
          </tr>
      </table>
  </div>
            
</div>
    <div margin-left="100px" class="alert" id="divalert1" runat="server" visible="false" style="height: 31px">
            <div class="col-md-4"></div>
                </div>
        <div class="alert alert-success" role="alert" runat="server" id="divsucess" visible="false">
  <h4 class="alert-heading">Solicitud enviada!!</h4>
  <p>Se ha enviado con exito la solicitud, ahora debera aguardar a su aprobacion</p>
</div>
    <center>
        <asp:Label ID="lblfamilia" runat="server" Text=""></asp:Label>
        <asp:GridView ID="gv1" runat="server" CssClass ="table tab-content" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="nro_socios" HeaderText="Socio" />
                    <asp:BoundField DataField="documento" HeaderText="Documento" />
                    <asp:BoundField DataField="apenomb" HeaderText="Apellido y Nombre" />
                    <asp:BoundField DataField="nro_socio" HeaderText="Nro Socio" />
                    <asp:BoundField DataField="par" HeaderText="Parentesco" />
                </Columns>

            </asp:GridView>
    
        </center>
</asp:Content>
