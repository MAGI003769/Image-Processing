function [size] = fsize(file_name)
fp = fopen(file_name, 'r');
fseek(fp, 0 ,1);
size = ftell(fp);
fclose(fp);
return  %||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
