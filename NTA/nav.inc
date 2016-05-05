 <div class="row">
<div class="col-md-8 col-lg-12  nav nav-tabs">
        <ul class="nav nav-tabs" >
            <li><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/index.aspx">Home</asp:HyperLink></li>


        <%   if (Session["mem"] != null)
                {  %>
          <li><asp:HyperLink ID="hpviewcourse" runat="server" NavigateUrl="~/stdRegCourse.aspx">View Course</asp:HyperLink></li>
          <li><asp:HyperLink ID="vcourse" runat="server" NavigateUrl="~/usersCourses.aspx">Current Courses</asp:HyperLink></li>
            <% if (client.mem_tp == "staff") { %>
            <asp:Label ID="lbladmin" runat="server" Text="Admin: "></asp:Label>
                    <li role="presentation"><asp:HyperLink ID="hlregcourse1" runat="server" NavigateUrl="~/Register.aspx.cs">Register Users</asp:HyperLink></li>
           <li> <asp:HyperLink ID="hlregcourse2" runat="server" NavigateUrl="~/regCourse.aspx.cs">Register Courses</asp:HyperLink></li>
             <%   } %>
        </ul>
        </div>
        
        <div class="col-md-4">Welcome:  <mark><% =client.fname   %></mark> to NTA
            
            <asp:Button ID="btnlogout" runat="server" Text="Logout" OnClick="btnlogout_Click" class="btn btn-default"/></div>
          
            <%  }  else  {   %>
            <asp:HyperLink ID="logininlink" runat="server" NavigateUrl="~/login.aspx">Login in</asp:HyperLink>
        
            <%} %>
            <script runat="server">

    protected void btnlogout_Click(object sender, EventArgs e)
    {
                Session.Abandon();
    }
</script>
   

    </div>