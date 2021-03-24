///////////VALIDATE REGISTER
function formRegister(){
    $("#form-register").validate({
        rules: {
            name: "required",
            dni: "required",
            surname: "required",
            email: {
                required: true,
                email: true
			},
			country: "required",
            city: "required",
            password: {
                required: true,
                minlength: 6
			},            
            terms: "required"
		},
        messages: {
            name: "Ingresa tu nombre",
			surname: "Ingresa tus apellidos",
            dni: "Ingresa el número de tu DNI",            
            email: "Ingresa un correo electrónico válido",
			country: "Selecciona el país donde resides",
            city: "Selecciona la ciudad donde resides",
			password: "Ingresa una contraseña con un mínimo de 6 caracteres",
            terms: "Acepta los Términos y Condiciones"
			
		},
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
                url: "/Registro/Participantes",
                beforeSend: function(){
                    console.log('Enviando');
                    //$('#submit').text('Enviando...');
					$('#submit').val('Enviando...');
                    $('#submit').attr("disabled", true);
				},
				//datatype: 'json',
                success: function(rspt) {
                    console.log('respuesta recibida! ' + rspt );
                    var data = jQuery.parseJSON(rspt);

                    console.log(data);
					
					if (data.success === 1) {
						// Sí registro con exito
						$('#submit').val('Crear cuenta')
						$('#submit').attr("disabled", false);																	
						$("#form-register").resetForm();						
						setTimeout(function(){
							fn_close();//Cierra todos los modals
							$("body").addClass("scroll");
							$(".registroconfirmado").fadeIn(); // muestra modal de confirmación						
						}, 5000);
						
						} else{		
							//Sí usuario ya existe 
							$("#sms").html( data.msg );						
							$('#submit').val('Crear cuenta')
							$('#submit').attr("disabled", false);
					}
				},
                error: function() {                   
                    console.log('Error de conexión! ');
					$("#sms").html( 'Error - Verifica tu conexión' );						
					$('#submit').val('Crear cuenta')
					$('#submit').attr("disabled", false);
							
					
				}
			});
		}
	});
}
///////////////////VALIDATE LOGIN
function formLogin(){
    $("#form-login").validate({
        rules: {           
            email: {
                required: true,
                email: true
			},			
            password: {
                required: true,
                minlength: 6
			}
		},
        messages: {
            email: "Ingresa tu correo electrónico",			
			password: "Ingresa tu contraseña previamente registrada"			
		},
        showErrors: function(errorMap, errorList) {
            $("#form-login").find("input, select").each(function() {
                $(this).removeClass("error");
			});
            $("#loginMsj").html("");
			if(errorList.length) {
				$("#loginMsj").html(errorList[0]['message']);
				$(errorList[0]['element']).addClass("error");
			}
		},
        submitHandler: function(form) {
            $(form).ajaxSubmit({
                type:"POST",
                data: $(form).serialize(),
                url: "/registro/login",
                beforeSend: function(){
                    console.log('Enviando');
                    //$('#submit').text('Enviando...');
					$('#submitLogin').val('Validando...');
                    $('#submitLogin').attr("disabled", true);
				},
				//datatype: 'json',
                success: function(rspt) {
                    console.log('respuesta recibida! ' + rspt );
                    var data = jQuery.parseJSON(rspt);					
					if (data.success === 1) {
						// Sí registro con exito
						// @SESSION_START;						
						} else{		
							//Sí usuario no existe
							$("#loginMsj").html( data.msg );						
							$('#submitLogin').val('Ingresar')
							$('#submitLogin').attr("disabled", false);
					}
				},
                error: function() {                   
                    console.log('Error de conexión! ');
					$("#loginMsj").html( 'Error - Verifica tu conexión' );						
					$('#submitLogin').val('Ingresar')
					$('#submitLogin').attr("disabled", false);
				}
			});
		}
	});
}
///////////////////SEND PASSWORD
function formPassword(){
    $("#form-password").validate({
        rules: {           
            email: {
                required: true,
                email: true
			}
		},
        messages: {
            email: "Ingresa tu correo electrónico"		
		},
        showErrors: function(errorMap, errorList) {
            $("#form-password").find("input, select").each(function() {
                $(this).removeClass("error");
			});
            $("#PassMsj").html("");
			if(errorList.length) {
				$("#PassMsj").html(errorList[0]['message']);
				$(errorList[0]['element']).addClass("error");
			}
		},
        submitHandler: function(form) {
            $(form).ajaxSubmit({
                type:"POST",
                data: $(form).serialize(),
                url: "/registro/sendpassword",
                beforeSend: function(){
                    console.log('Enviando');
                    //$('#submit').text('Enviando...');
					$('#submitPass').val('Validando...');
                    $('#submitPass').attr("disabled", true);
				},
				//datatype: 'json',
                success: function(rspt) {
                    console.log('respuesta recibida! ' + rspt );
                    var data = jQuery.parseJSON(rspt);					
					if (data.success === 1) {
						// Sí envia con exito						
						$('#submitPass').val('Enviar')
						$('#submitPass').attr("disabled", false);																	
						$("#form-password").resetForm();	
						setTimeout(function(){
							fn_close();//Cierra todos los modals
							$("body").addClass("scroll");
							$(".passwordconfirmado").fadeIn(); // muestra modal de confirmación						
						}, 5000);					
						} else{		
							//Sí usuario no existe
							$("#PassMsj").html( data.msg );						
							$('#submitPass').val('Enviar')
							$('#submitPass').attr("disabled", false);
					}
				},
                error: function() {                   
                    console.log('Error de conexión! ');
					$("#PassMsj").html( 'Error - Verifica tu conexión' );						
					$('#submitPass').val('Enviar')
					$('#submitPass').attr("disabled", false);						
				}
			});
		}
	});
}
	var mySwiper = new Swiper ('.swiper-container', {
		direction: 'horizontal',
		loop: true,
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		}
	});

	// $(function() {

		function fn_open(value) {
			var modal = $(value).attr("href");

			$("body").addClass("scroll");
			$(modal).fadeIn();
		}

		function fn_close() {
			$("body").removeClass("scroll");
			$(".modalBox").hide();
		}

		$(".modaLink").on("click", function(e) {
			e.preventDefault();
			fn_close();
			fn_open(this);

		});

		$(".close, .BtnClose").on("click", function(e) {
			e.preventDefault();
			fn_close();
		});

		$(".file-upload").on("click", function(e) {
			e.preventDefault();

			var file 		= $(this).find("input");
			var fileName 	= file.val().split('\\').pop();

			file.trigger('click');
			//$(this).find("span").text(fileName);
		});

		$(document).mouseup(function (e) {
			var container = $(".modalBox .wrapper");

			if (!container.is(e.target) && container.has(e.target).length === 0) {
				$("body").removeClass("scroll");
				$(".modalBox").hide();
			}
		});


		$('.btn-menu').on('click', function(e){
			e.preventDefault()
			$('.wrapper-menu-right').addClass('open');
		})

		$(document).mouseup(function(e){
			var contain = $('.wrapper-menu-right');
			var close = $('.wrapper-menu-right .close span');
			if(contain.is(e.target) || close.is(e.target)){
				$(contain).removeClass('open');
				console.log('targett!');
			}
		})
	// });
	
$(window).resize(function(){
    // resize();
})
$(document).ready(function(){
    //slider();
   // btnMenu();
    formRegister();
	formLogin();
	formPassword();
    //eye();
    //down();
});