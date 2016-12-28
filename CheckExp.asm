.model small  

.stack 200h

.data
str db "2(3*(2*3)",'$' 
c1 db 0
c2 db 0

.code

mov ax,@data
mov ds,ax
mov es,ax ; let es=ds
lea si,str  ;source address for str
lea di,str ;destination address for str
mov cx,10  ;6= number of bytes in str
mov bl,'('
mov bh,')'
cld ; Set Auto-Increment mode
next: lodsb ;load al with a byte from str
cmp al,bl
je L1 ; if the byte is not a character   (

cmp al,bh
je L2 ;if the byte is )

jne L3 ;if the byte is not ( or )


L1: 
 add c1,1; ..bnzeed countr1
jmp L3 

L2:
 ; ...bnzeed counter2]
add c2,1
jmp L3

L3:
loop next    
            
       
 mov al,c1     
 cmp al,c2
 je l5 
 mov dl,'N'
 mov ah,2
 int 21h 
 jmp endd
 
 
 
 l5: 
 lea si,str  ;source address for str
 lea di,str  
 mov cx,15  ;6= number of bytes in str
mov bl,'A'
mov bh,'Z'
cld ; Set Auto-Increment mode
next1: lodsb ;load al with a byte from str
cmp al,bh
jg L31 ; if the byte is not a character

cmp al,bl
jl L31 ;if the byte is not a character

jge L21 ;if the byte is an upper case letter


L21: 
 
mov dl,'N' ;NOT VALID
mov ah,2
int 21h  
jmp endd


L31:
loop next1
 
jmp l9

l9:   ;+..*  
        
  
    mov cx,10
	mov al,'+'
	lea di,str		;di point to the start of the string  
	
    cld
	l17:
	scasb				;test if the current char. is 'B'
	je found
	cnt:
	loop l17 
	jmp l19

	
	found:		         ;if 'B' is found the following section executed

	cmp byte ptr[di] , '*'         ;compare the char. after 'B'
	jne cnt
	
	mov dl,'n'			 ;print 'not valid'
	mov ah,2 
	int 21h  
	jmp endd
	
	
	
l19: ;()
    mov cx,10
	mov al,'('
	lea di,str		;di point to the start of the string  
	
    cld
	l16:
	scasb				;test if the current char. is '('
	je foundd
	cntt:
	loop l16 
	jmp l20

	
	foundd:		         ;if '(' is found the following section executed

	cmp byte ptr[di] , ')'         ;compare the char. after ')'
	jne cntt
	
	mov dl,'n'			 ;print 'not valid'
	mov ah,2 
	int 21h  
	jmp endd

l20: ;+../ 

    mov cx,10
	mov al,'+'
	lea di,str		;di point to the start of the string  
	
    cld
	l14:
	scasb				;test if the current char. is '+'
	je founnd
	cnnt:
	loop l14
	jmp l22

	
	founnd:		         ;if '+' is found the following section executed

	cmp byte ptr[di] , '/'         ;compare the char. after '/'
	jne cnnt
	
	mov dl,'n'			 ;print 'not valid'
	mov ah,2 
	int 21h  
	jmp endd 
	
	
l22:
mov dl,'v'			 ;print 'valid'
	mov ah,2 
	int 21h  
	jmp endd 

	       
    
    
                  
 endd:   
mov AH,4cH ;exit to DOS
int 21H


end
