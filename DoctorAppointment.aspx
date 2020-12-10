<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorAppointment.aspx.cs" Inherits="DoctorAppointment.DoctorAppointment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>E-Appointment</title>
    <%-- Bootstrap css--%>
    

    <link href="Bootstrap/CSS/bootstrap.min.css" rel="stylesheet" />
    <%-- Datatable css--%>
    <link href="Datatables/css/jquery.dataTables.min.css" rel="stylesheet" />
    <%-- Fontawsome css--%>
    <link href="Fontawsome/css/all.css" rel="stylesheet" />
     <%-- Custom css--%>
    <link href="css/CustomeStyle.css" rel="stylesheet" />

    <%--jquery js --%>
    <script src="Bootstrap/JS/jquery-3.5.1.slim.min.js"></script>
    <%--Bootstrap js --%>
    <script src="Bootstrap/JS/bootstrap.bundle.min.js"></script>
     <%--datatabel js --%>
    <script src="Datatables/js/jquery.dataTables.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
         <div class=" container">
           <div class="row mt-2">
            <div class="col-md-7 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-8">
                                <center>
                                    <h3>Doctor's Appointment</h3>
                                    <p>Fill the apoointment form for the doctor's appointment</p>
                                </center>
                            </div>
                            <div class="col-4"> 
                                 <img id="imgview1" src="img/doctor-icon.jpg" style="height:150px"/>
                            </div>
                        </div>
                       <div class="row">
                            <div class="col">
                                <center>
                                    <hr />
                                </center>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-6">
                                <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                                 <asp:TextBox ID="txtName" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-6">
                                <asp:Label ID="lblAge" runat="server" Text="Age"></asp:Label>
                                 <asp:TextBox ID="txtAge" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-6">
                                <asp:Label ID="lblDOB"  runat="server" Text="DOB"></asp:Label>
                                <asp:TextBox ID="txtDOB" class="form-control" TextMode="Date" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-6">
                                <asp:Label ID="lblBloodGroup" runat="server" Text="Blood Group"></asp:Label>
                                 <asp:TextBox ID="txtBloodGroup" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-6">
                                <asp:Label ID="lblMobileNumber" runat="server" Text="Mobile No."></asp:Label>
                                 <asp:TextBox ID="txtMobileNumber" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-6">
                                 <asp:Label ID="lblEmail" runat="server" Text="E-mail"></asp:Label>
                                 <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                       
                        <div class="row mt-2">
                            <div class="col-6">
                                <asp:Label ID="lblDOA" runat="server" Text="Date OF Appointment"></asp:Label>
                                 <asp:TextBox ID="txtDOA" TextMode="Date" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-6">
                                 <asp:Label ID="lbluploadreport" runat="server" Text="Upload your Report"></asp:Label>
                                <asp:FileUpload ID="FileUploadReport" runat="server" />
                            </div>
                        </div>
                       
                        <div class="row mt-2">
                            <div class="col-12">
                                 <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                                 <asp:TextBox ID="txtAddress" TextMode="MultiLine" Rows="2" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                         <div class="row mt-2">
                           <div class="col-8 mt-2"></div>
                            <div class="col-4 mt-2">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary fa-pull-right btn-block   " OnClick="btnSubmit_Click" runat="server" Text="Submit" />
                            </div>
                        </div>
                     </div>
                    </div>
                </div>
               </div>
            </div>
    </form>
</body>
</html>
