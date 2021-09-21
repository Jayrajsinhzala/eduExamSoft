<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="LoginNew.aspx.cs" Inherits="LoginNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="wrapper">
		<div id="wrappertop"></div>

		<div id="wrappermiddle">

			<h2>Login</h2>

			<div id="username_input">

				<div id="username_inputleft"></div>

				<div id="username_inputmiddle">
				
					
                    <asp:TextBox ID="url" placeholder="E-mail Address" BorderStyle="None" runat="server" Width="280px"></asp:TextBox>
					
				
				</div>

				<div id="username_inputright"></div>

			</div>

			<div id="password_input">

				<div id="password_inputleft"></div>

				<div id="password_inputmiddle">
				
					
                    <asp:TextBox ID="Password1" TextMode="Password" placeholder="Password" BorderStyle="None" runat="server" Width="280px"></asp:TextBox>
					
				
				</div>

				<div id="password_inputright"></div>

			</div>

			<div id="submit">
                
                <asp:ImageButton id="submit1" runat="server" Width="287px" ImageUrl="~/images/submit_hover.png" OnClick="submit1_Click" />
				
			</div>


			<div id="links_left">

			<asp:LinkButton ID="ForgotLinkBtn" runat="server" PostBackUrl="~/Admin/ForgotPassword.aspx" OnClick="ForgotLinkBtn_Click">Forgot your Password?</asp:LinkButton>

			</div>

			<div id="links_right">
                <asp:LinkButton ID="SignupBtn" runat="server">Not a Member Yet?</asp:LinkButton>

			</div>

		</div>
        
		<div id="wrapperbottom">
            <div class="g-recaptcha" data-sitekey="6Ld_zdIUAAAAABuOOWYc5VTq581ZXKYqfyACbbMV"></div>
		</div>
		
		<%--<div id="powered">
		<p>Powered by <a href="http://www.premiumfreebies.eu">Premiumfreebies Control Panel</a></p>
		</div>--%>
	</div>


</asp:Content>

