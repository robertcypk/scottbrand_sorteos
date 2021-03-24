function slider(){
    var owl = $('#slider');
    owl.owlCarousel({
        loop:true,
        nav:false,
        dots:false,
        smartSpeed: 650,
        responsive:{
            0:{
                items:3
			},
            600:{
                items:3
			},
            1000:{
                items:3
			}
		}
	});
	
    $('.next').click(function(){
        owl.trigger('next.owl.carousel');
	})
    $('.prev').click(function(){
        owl.trigger('prev.owl.carousel');
	})
}
function btnMenu(){
    var cont = 1;
    var btn = $('.button-mobile');
    const nav = $('nav');
    $(btn).on('click', function(){
        if(cont == 1){
            $(btn).addClass('active');
            $(nav).slideDown(300);
            cont = 0;
			}else{
            cont = 1;
            $(btn).removeClass('active');
            $(nav).slideUp(300);
		}
	});
}
function resize(){
    var ww = $(window).width();
    if (ww > 900) {
        $('nav').show();
	}
}
function formVal(){
    $("#form-register").validate({
        rules: {
            name: "required",
            dni: "required",
            surname: "required",
            email: {
                required: true,
                email: true
			},
            tel: {
                required: true,
                number: true
			},
            number: "required",
            device: "required",
            country: "required",
            higher: "required",
            terms: "required"
		},
        messages: {
            name: "Ingresa tu nombre",
            dni: "Ingresa el número de tu DNI",
            surname: "Ingresa tus apellidos",
            email: "Ingresa un correo electrónico válido",
            tel: "Ingresa tu teléfono de contacto",
            number: "Ingresa el número de la Boleta o Factura",
            device: "Selecciona el modelo de la impresora HP Deskjet que compraste",
            country: "Selecciona el país participante",
            higher: "Confirma que tienes la mayoria de edad",
            terms: "Acepta los Términos y Condiciones de la Promoción HP"
			
		},// |
        showErrors: function(errorMap, errorList) {
            $("#form-register").find("input, select").each(function() {
                $(this).removeClass("error");
			});
            $("#sms").html("");
			if(errorList.length) {
				$("#sms").html(errorList[0]['message']);
				$(errorList[0]['element']).addClass("error");
			}
		},
        submitHandler: function(form) {
            $(form).ajaxSubmit({
                type:"POST",
                data: $(form).serialize(),
                url: "http://hpscool.com/registro/registro",
                beforeSend: function(){
                    console.log('Enviando');
                    $('#submit').text('Enviando...');
                    $('#submit').attr("disabled", true);
				},
				//datatype: 'json',
                success: function(rspt) {
                    console.log('respuesta recibida! ' + rspt );
                    var data = jQuery.parseJSON(rspt);
					
					if (data.success === 1) {
						// set data function response
						//$("#sms").html( data.msg );                           
						setCookie("dni",data.dni);
						$("#documento").val( data.dni );
						$('#submit').text('Enviar Datos')
						$('button').attr("disabled", false);
						// $('.pop-form').fadeIn(300);
						$('.pop-new').fadeIn(300);
						
						$("#form-register").resetForm();
						setTimeout(function(){
							$('.pop-form').fadeOut(300);
							$.fn.fullpage.moveTo(3); // scroll to form code
						}, 5000);
						
						} else if (data.success === 2) {
							// set data function response
							//$("#sms").html( data.msg );                           
							setCookie("dni",data.dni);
							$("#documento").val( data.dni );
							$('#submit').text('Enviar Datos')
							$('button').attr("disabled", false);
							//$('.pop-form').fadeIn(300);
							$('.pop-reg').fadeIn(300);
							$("#form-register").resetForm();
							setTimeout(function(){
								$('.pop-form').fadeOut(300);
								$.fn.fullpage.moveTo(3); // scroll to form code
							}, 5000);
							
							}else{						
								$("#sms").html( data.msg );						
								$('#submit').text('Enviar Datos')
								$('button').attr("disabled", false);
					}
					
					
				},
                error: function() {
                    /*
						$('#contact').fadeTo( "slow", 0.15, function() {
                        $('#error').fadeIn();
					});*/
                    console.log('Error! ');
				}
			});
		}
	});
}
function eye(){
    var btn = $('.button-eye');
    var square = $('.help');
    $(btn).hover(function(){
        $(square).addClass('show');
        console.log('Hover!!')
		}, function(){
        $(square).removeClass('show');
	})
}
function down(){
    var button = $('.down');
    $(button).on('click', function(){
        $.fn.fullpage.moveSectionDown();
	})
}
$(function(){
    var btn = $('.pop-close');
    var pop = $('.pop-form');
    $(btn).on('click', function(){
        $(pop).fadeOut(300);
	})
})
$(window).resize(function(){
    resize();
})
$(document).ready(function(){
    //slider();
    btnMenu();
    formVal();
    eye();
    down();
});