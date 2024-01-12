<%--<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MS_COE_Day1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MS_COE_Day1._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Candidate Management</title>
    <%--<script src="Scripts/jquery-3.4.1.min.js"></script>--%>
    <%--<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>--%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>
<body>
<h1>Candidate Management</h1>
<div>
    <h2>Add Participant</h2>
    <input type="text" id="txtName" placeholder="Name" />
    <input type="email" id="txtEmail" placeholder="Email" />
    <button onclick="addCandidate()">Add Candidate</button>
</div>
<hr />
<div>
    <h2>Get Candidates</h2>
    <ul id="CandidateList"></ul>
    <button onclick="getCandidates()">Get Candidate</button>
</div>
<hr />
<div>
    <h2>Delete Candidate</h2>
    <input type="text" id="txtDeleteId" placeholder="Candidate ID" />
    <button onclick="deleteCandidate()">Delete Candidate</button>
</div>
    </body>
<script>
    function addCandidate() {
        var name = $('#txtName').val();
        var email = $('#txtEmail').val();
        

        $.ajax({
            url: 'CandidateService.asmx?op=AddCandidate',
            type: 'POST',
            dataType: 'xml',
            contentType: 'text/xml; charset=utf-8',
            data: '<?xml version="1.0" encoding="utf-8"?>' +
                '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ' +
                'xmlns:xsd="http://www.w3.org/2001/XMLSchema" ' +
                'xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">' +
                '<soap:Body>' +
                '<AddCandidate xmlns="http://tempuri.org/">'+
                '<name>'+name+'</name>'+
                '<email>'+email+'</email>'+
                '</AddCandidate>'+
                '</soap:Body>'+
                '</soap:Envelope>',
            success: function (data) {
                alert('Candidate added Successfully');
            },
            error: function (error) {
                alert('Error adding Candidate');
                //console.error('Error adding Candidate', error);
            }
        });
    }

    function getCandidates() {
        $.ajax({
            url: 'CandidateService.asmx?op=GetCandidates',
            type: 'POST',
            datatype: 'xml',
            contentType: 'text/xml; charset=utf-8',
            data: '<?xml version="1.0" encoding="utf-8"?>' +
                '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ' +
                'xmlns:xsd="http://www.w3.org/2001/XMLSchema" ' +
                'xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">' +
                '<soap:Body>' +
                '<GetCandidates xmlns="http://tempuri.org/"></GetCandidates>' +
                '</soap:Body>' +
                '</soap:Envelope>',
            success: function (data) {
                var candidates = $(data).find('Candidate');
                var candidateList = $('#CandidateList');
                candidateList.empty();

                candidates.each(function () {
                    var candidate = $(this);
                    var id = candidate.find('ID').text();
                    var name = candidate.find('Name').text();
                    var email = candidate.find('Email').text();
                    candidateList.append('<li>ID: ' + id + ', Name: ' + name + ', Email: ' + email + '</li>');

                });
            },
            error: function (error) {
                console.error('Error getting candidates', error);
            }
        });

    }

    function deleteCandidate() {
        var candidateId = $("txtDeleteId").val();
        debugger;

        $.ajax({
            url: '/CandidateService.asmx?op=DeleteCandidatesById',
            type: 'POST',
            datatype: 'xml',
            contentType: 'text/xml; charset=utf-8',
            data: '<?xml version="1.0" encoding="utf-8"?>' +
                '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ' +
                'xmlns:xsd="http://www.w3.org/2001/XMLSchema" ' +
                'xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">' +
                '<soap:Body>' +
                '<DeleteCandidatesById xmlns="http://tempuri.org/">' +
                '<candidateId>' + candidateId + '</candidateId>' +
                '</DeleteCandidatesById>' +
                '</soap:Body>' +
                '</soap:Envelope>',
            success: function (data) {
                debugger; alert('Candidate deleted');
            },
            error: function (error) {
                debugger; console.error('Error', error);
            }
        });
    }
</script>

</html>
