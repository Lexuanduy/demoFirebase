<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://www.gstatic.com/firebasejs/5.5.5/firebase-app.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/5.5.5/firebase-firestore.js"></script>
<title>Fire Store</title>
</head>
<body>
<!-- 	<h1 id="hotDogOutput">Status</h1> -->
ID:
	<input type="textfield" id="idPosts" />
	ID:
	<input type="textfield" id="idPosts" />
	<br> Posts name:
	<input type="textfield" id="postName" />
	<br> Posts content:
	<input type="textfield" id="postContent" />
	<br>
	<button id="saveButton">Save</button>
	<br>
	Show content: <input type="text" id="idGetContent" />
	<!-- <div id="get-status"></div>
	<button id="editButton">Edit</button> -->
	<script>
	var config = {
		apiKey : "AIzaSyB6Y4LfqpiWjjbIFL9AAX4qQ2YheXKct4I",
		authDomain : "websitegae-218105.firebaseapp.com",
		databaseURL : "https://user.firebaseio.com",
		projectId : "websitegae-218105",
		storageBucket : "websitegae-218105.appspot.com",
		messagingSenderId : "564071622405",
	};
	firebase.initializeApp(config);
	var firestore = firebase.firestore();
	firestore.settings({
		  timestampsInSnapshots: true
		});
	var document = null;
	
	const docRef = firestore.doc("samples/post1");
	const inputId = document.querySelector("#idPosts");
	const inputPostName = document.querySelector("#postName");
	const inputContent = document.querySelector("#postContent");
	const saveBtn = document.querySelector("#saveButton");
	
	saveBtn.addEventListener("click", function(){
		const textId = inputId.value;
		const textPostName = inputPostName.value;
		const textContent = inputContent.value;
        docRef.set({
        	Id: textId,
        	PostName: textPostName,
        	Content: textContent
        }).then(function(docRef){
        	console.log("status save!");
        }).catch(function(error){
        	console.log("Got an error", error);
        });
	})
	
	
	//get by id
	var id = "ps002";
	var postsRef = firestore.collection("samples");
	var query = postsRef.where("Id", "==", id);
	
	
	docRef.get().then(function(doc) {
	    if (doc.exists) {
	        console.log("Document data:", doc.data());
/* 	        document.getElementById("idGetContent").value = doc.data.Content; */
	    } else {
	        // doc.data() will be undefined in this case
	        console.log("No such document!");
	    }
	}).catch(function(error) {
	    console.log("Error getting document:", error);
	});
	
	/* const editBtn = document.querySelector("#editButton");
	editBtn.addEventListener("click", function(){
	}) */
</script>
</body>
</html>