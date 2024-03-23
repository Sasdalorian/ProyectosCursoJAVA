const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

$("#contacto button").on("click", () => {
  if(!$("#nombre").val() || !$("#asunto").val() || !$("#mensaje").val()){
    alert("🚫 Debes rellenar todos los campos 🚫");	
  }
  else{
    alert("Mensaje Enviado con Éxito ✅");
  }
  
});

$(document).ready(function(){
  $(window).scroll(function(){
    var scroll = $(window).scrollTop();
    if (scroll > 100) {
      $(".navbar").addClass("nav-bg");
    }else{
      $(".navbar").removeClass("nav-bg");    
    }
  });
});
