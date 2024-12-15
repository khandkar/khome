#include <time.h>

#include <stdio.h>
#include <unistd.h>

#include <ncurses.h>


#define BS 50


int
main()
{
	time_t t;
	char buf[BS];

	initscr();
	timeout(0);
	while (getch() == -1) {
		t = time(NULL);
		strftime(buf, BS, "%A %Y-%m-%d %H:%M:%S", localtime(&t));
		mvprintw(0, 0, "%s", buf);
		refresh();
	}
	endwin();
	return 0;
}
