
window.onload = function() {

// the following code adds event listeners to the buttons
// you'll learn more about this later
// for this exercise, you are going to write the functions for
// what happens when the user clicks on the buttons.
  var saveButton = document.getElementById('save-button');
  saveButton.addEventListener('click', addToDoItem, false);

  var doneButton = document.getElementById('done-button');
  doneButton.addEventListener('click', markAsDone, false);

  function addToDoItem() {
    // add your code here
    // this should create a new list item in the to-do list
    // and set the text as the input from the todo-input field

    var contenido = document.getElementById('todo-input');
    document.getElementById('todo-list-items').innerHTML += "<p>"+contenido.value+"</p>";
   
  }

  function markAsDone() {
    // add your code here
    // this should remove the FIRST li item from to-do list
    // and add it to the done list (with the strikethrough!)

    var contenidoListado = document.getElementById('todo-list-items');
    var listListado = contenidoListado.getElementsByTagName('li');

    document.getElementById('done-list-items').innerHTML += "<p class='done'>"+listListado[0].innerHTML+"</p>";
    
   //var contenidoListado2 = document.getElementsByClassName('todo-list-items');
   //var listListado2 = contenidoListado2.getElementsByTagName('li');
   //var x = contenidoListado2.children[1];
   //contenidoListado2.parentNode.removeChild(x);
   
   //var lis = document.getElementsByClassName("todo-list-items")[0]; 
   //lis.removeChild(lis.childNodes[0]);
    }
   
}
