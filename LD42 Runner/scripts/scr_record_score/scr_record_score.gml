///scr_record_score(score)

ini_open("data.ini")

for (var i=1;i<=5;i++){
	if round(argument0)>ini_read_real("Highscores",string(i),0){
		for (var j=1;j<=5-i;j++){
			ini_write_real("Highscores",string(11-j),ini_read_real("Highscores",string(10-j),0))
		}
		ini_write_real("Highscores",string(i),round(argument0))
		global.place = i
		break
	}
}

ini_close()



