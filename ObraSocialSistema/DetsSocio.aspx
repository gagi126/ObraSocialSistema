<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/_principal.Master" CodeBehind="DetsSocio.aspx.vb" Inherits="ObraSocialSistema.DetsSocio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
  <div class="jumbotron">
    <p>Detalles del socio seleccionado</p>
          <table class="table thead-light">
        <tr>
            <th>
                <table>
                    <tr>
                    <th scope ="col">Nro Socio: </th>
                    <td>
                        <asp:Label ID="lbl_nro_socio" runat="server" Text=""></asp:Label>
                    </td>
                    </tr>
                    <tr>
                        <th scope ="col">Apellido: </th>
                        <td>
                            <asp:Label ID="lbl_apellido" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">Nombre: </th>
                        <td>
                            <asp:Label ID="lbl_name" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                     <tr>
                        <th scope="col">Nro Documento: </th>
                        <td>
                            <asp:Label ID="lbl_numdoc" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                     <tr>
                        <th scope="col">Fecha Nacimiento: </th>
                        <td>
                            <asp:Label ID="lbl_fechanac" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">Sexo: </th>
                        <td>
                            <asp:Label ID="lbl_sexo" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                    <th scope="col">Titular: </th>
                        <td>
                            <asp:Label ID="lbl_nrosocio_tit" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
                </th>
            <th >
        <table>
            <tr>
                 <th scope="col">Parentesco: </th>
                        <td>
                            <asp:Label ID="lbl_paren" runat="server" Text=""></asp:Label>
                        </td>
            </tr>
            <tr>
                <th scope="col">Plan: </th>
                        <td>
                            <asp:Label ID="lbl_plan_os" runat="server" Text=""></asp:Label>
                        </td>
            </tr>
            <tr>
                <th scope="col">Direccion: </th>
                        <td>
                            <asp:Label ID="lbl_dir" runat="server" Text=""></asp:Label>
                        </td>
            </tr>
            <tr>
                <th scope="col">Codigo Postal:   </th>
                        <td>
                            <asp:Label ID="lbl_cp" runat="server" Text=""></asp:Label>
                        </td>
            </tr>
            <tr>
                <th scope="col">Telefonos:  </th>
                        <td>
                            <asp:Label ID="lbl_telefono" runat="server" Text=""></asp:Label>
                        </td>
            </tr>
            <tr>
                <th scope="col">E-mail:  </th>
                        <td>
                            <asp:Label ID="lbl_mail" runat="server" Text=""></asp:Label>
                        </td>
            </tr>
            <tr>
                <th scope="col">Estado:  </th>
                        <td>
                            <asp:Label ID="lbl_estado" runat="server" Text=""></asp:Label>
                        </td>
            </tr>
        </table>  
                </th>
            </tr>
              </table>
      <center><asp:Label runat="server" Text="" CssClass="alert alert-danger" visible="false" ID="lblalerta"><strong>Atencion: </strong>El socio seleccionado no tiene adherentes a cargo.</asp:Label></center>
  </div>
      <table Width="500px">

                  <asp:GridView ID="gv1" runat="server" CssClass ="table tab-content" display="none" AutoGenerateColumns="False" Width="500px">
          <Columns>
              <asp:BoundField DataField="nro_socios" HeaderText="Socio" />
              <asp:BoundField DataField="apellido" HeaderText="Apellido" />
              <asp:BoundField DataField="nombre" HeaderText="Nombre" />
              <asp:BoundField DataField="documento" HeaderText="Documento" />
              <asp:BoundField DataField="fecha_nac" HeaderText="Fecha Nacimiento" />
              <asp:BoundField DataField="sexo1" HeaderText="Sexo" />
              <asp:BoundField DataField="nro_socio" HeaderText="Nro Socio" />
              <asp:BoundField DataField="par" HeaderText="Parentesco" />
              <asp:BoundField DataField="plan_os" HeaderText="Plan" />
              <asp:BoundField DataField="direccion" HeaderText="Direccion" />
              <asp:BoundField DataField="cp" HeaderText="Codigo Postal" />
              <asp:BoundField DataField="telefonos" HeaderText="Telefono" />
              <asp:BoundField DataField="mail" HeaderText="E-mail" />
              <asp:BoundField DataField="est" HeaderText="Estado" />
          </Columns>
      </asp:GridView>
          </table>
</div>
</asp:Content>
