<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="ObraSocialSistema.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link rel="stylesheet" href="bootstrap.min.css"  />
    <script type="text/javascript" src="bootstrap.min.js"></script>
    <script type="text/javascript" src="jquery-3.0.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

        <style type="text/css">
            .auto-style1 {
                width: 226px;
                height: 241px;
            }
           .alert {
            display: block;
            }
        </style>
</head>
<body>
  
</body>
    <center>
        <h1>Bienvenido al sistema de gestion</h1>
        <asp:Panel runat="server" id="panelalerta">
           <asp:Label runat="server" Text="" CssClass="alert alert-danger" visible="false" ID="lblalerta"><strong>Atencion:</strong> El usuario o la clave son incorrectos, por favor revise lo ingresado e intente nuevamente.</asp:Label>
        </asp:Panel>
<asp:Panel runat="server" ID="panel1">
    
    <form class="auto-style1" runat="server">
  <div class="form-group">
    <label for="user">Usuario:</label>
     <asp:TextBox runat="server" ID="txtusuario"  CssClass="form-control"></asp:TextBox>
  </div>
  <div class="form-group">
    <label for="pwd">Clave:</label>
        <asp:TextBox runat="server" ID="txtpassword" CssClass ="form-control" input type="password"></asp:TextBox>
    <%--<input type="password" class="form-control" id="pwd">--%>
  </div>

  <%--<button type="submit" class="btn btn-default">Iniciar Sesion</button>--%>
   <asp:Button runat="server" Text="Iniciar Sesion" CssClass="btn btn-default" ID="btniniciar"></asp:Button>
</form>
</asp:Panel>
    
        </center>
</html>
