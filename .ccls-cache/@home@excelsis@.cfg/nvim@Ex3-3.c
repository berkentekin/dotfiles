#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXLEN 1000

void expand(char from[], char to[]);
int get_line(char line[], int lim);

int main(void)
{
	char s1[MAXLEN];
	char s2[MAXLEN];
	while (get_line(s1, MAXLEN) != 0) {
		expand(s1, s2);
		printf("%s", s2);
	}


	return 0;
}

int get_line(char s[], int lim)
{
	int i, c;
	for (i = 0; i < lim-1 && (c = getchar()) != EOF && c != '\n'; ++i) {
		s[i] = c;
	}
	if (i == 0) {
		s[i] = '\0';
		return i;
	}
	s[i++] = '\n';
	s[i--] = '\0';
	return i;
}

void expand(char from[], char to[])
{
	int i, j, c;
	for (i = 0, j = 0; from[i] != '\0'; i++)
		if (from[i] == '-' && i > 0)
			for (c = from[i-1]; c <= from[i+1]; c++)
				to[j++] = c;
	to[j++] = '\n';
	to[j] = '\0';
}
