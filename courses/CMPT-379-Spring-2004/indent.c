
/* indent.c
 * compile with command: gcc -o indent indent.c
 * run as: ./indent < exprparsetree.txt
 */

#include <stdio.h>
#include <stdlib.h>
#include <strings.h>

#define BUFLEN 100000
#define INDLEN 150000

#define LEFT_BRACKET '('
#define RIGHT_BRACKET ')'
#define ESCAPE_CHAR '\\'

void indentN(int n, char* str);
void IndentLine(char* line, char* ind_str);

void IndentLine(char* line, char* ind_str)
{
  int indent[1024];
  int max_assign_level = -1; /* the max_level that has assigned indent[] */
  int level = 0;  /* current level */
  int indention = 0;
  int tmp_ptr = 0;
  char ch;
  
  ind_str[0] = '\0';

  ch = line[tmp_ptr];
  while(ch) {
    tmp_ptr ++;

    if (ch == ESCAPE_CHAR) { 
      char tmp[2];
      tmp[0] = ch;
      ch = line[++tmp_ptr]; 
      tmp[1] = ch;
      tmp[2] = '\0';
      strcat(ind_str, tmp);
      continue; 
    }

    if(ch == LEFT_BRACKET){
      if(max_assign_level < level) {
        /* first time to get to this level */
        max_assign_level++;
        indent[level] = indention % 80;
      } else{
          strcat(ind_str, "\n");
          indentN(indent[level], ind_str);
          indention = indent[level];
      }
      level++;
    } else{
      if(ch == RIGHT_BRACKET) {
        level--;
        max_assign_level = level;
      }
    }

    sprintf(ind_str, "%s%c", ind_str, ch);
    indention++;
    ch = line[tmp_ptr];
  }

}


/* append n spaces to str */
void indentN(int n, char* str)
{
  int i;
  
  for(i=0; i<n;i++){
    strcat(str, " ");
  }
}

int
main (int argc, char **argv)
{
  FILE *F;
  char line[BUFLEN];
  char indstr[INDLEN];

  if (argc < 2) { 
     F = stdin; 
  } else { 
     if ((F = fopen(argv[1], "r")) == NULL) {
        fprintf(stderr, "could not open %s\n", argv[1]);
     }
  }
  line[0] = '\0';
  indstr[0] = '\0';
  while (fgets(line, BUFLEN, F)) {
     if (feof(F)) { return(0); }
     IndentLine(line, indstr);
     printf("%s", indstr); 
     line[0] = '\0';
     indstr[0] = '\0';
  }
  fclose(F);
  return(0);
}

