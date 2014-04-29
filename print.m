function result = print (MATRIX)



for i = 0:max(MATRIX(:,1)),
	x = 4;
		
			for k = 0:x*8/(i+1),
				printf("-")
			endfor	
			for j = 1:size(MATRIX,1),
				for z = 0:x-2,
					printf(" ")
				endfor
				if (MATRIX(j, 1) == i),
					
					switch (MATRIX(j, 2))
						case 1
							printf("STABILITY")
						case 2
							printf("ERROR")
						case 3
							printf("SIGN")
						case 4
							printf("WIND")
						case 5
							printf("MAGNITUDE")	
						case 6
							printf("VISIBILITY")
						case 8
							printf("noauto")	
						case 9
							printf("auto")	
						otherwise
							printf("  ");
					endswitch
					x + 1;
				endif
			endfor
			printf("\n\n\n\n");
endfor
