BEGIN 	{
		count1 = 0;
		count2 = 0;
		count3 = 0;
		count4 = 0;
		count5 = 0;
	}

{
if(($3 =="1"))
	count1++;

if(($3 =="2"))
	count2++;

if(($3 =="7"))
	count3++;

if(($3 =="11"))
	count4++;

if(($3 =="9"))
	count5++;
}

END	{
		printf("No.of packets transmitted by node 1= %d \n", count1);
		printf("No.of packets transmitted by node 2= %d \n", count2);
		printf("No.of packets transmitted by node 7= %d \n", count3);
		printf("No.of packets transmitted by node 11= %d \n", count4);
		printf("No.of packets transmitted by node 9= %d \n", count5);
	}

BEGIN 	{
		count6 = 0;
		count7 = 0;
		count8 = 0;
		count9 = 0;
		count10 = 0;
	}

{
if(($1=="d") && ($3 =="1"))
	count6++;
if(($1=="d") &&($3 =="2"))
	count7++;
if(($1=="d") && ($3 =="7"))
	count8++;
if(($1=="d") && ($3 =="11"))
	count9++;
if(($1=="d") && ($3 =="9"))
	count10++;
}

END	{
		printf("No.of packets dropped of node 1= %d \n", count6);
		printf("No.of packets dropped of node 2= %d \n", count7);
		printf("No.of packets dropped of node 7= %d \n", count8);
		printf("No.of packets dropped of node 11= %d \n", count9);
		printf("No.of packets dropped of node 9= %d \n", count10);
	}
	

BEGIN 	{
		count11 = 0;
		count12 = 0;
		count13 = 0;
		count14 = 0;
		count15 = 0;
	}

{
if(($1=="r") && ($3 =="1"))
	count11++;

if(($1=="r") &&($3 =="2"))
	count12++;

if(($1=="r") && ($3 =="7"))
	count13++;

if(($1=="r") && ($3 =="11"))
	count14++;

if(($1=="r") && ($3 =="9"))
	count15++;
}


END	{
		printf("No.of packets of node 1 received= %d \n", count11);
		printf("No.of packets of node 2 received= %d \n", count12);
		printf("No.of packets of node 7 received= %d \n", count13);
		printf("No.of packets of node 11 received= %d \n", count14);
		printf("No.of packets of node 9 received= %d \n", count15);
	}

BEGIN 	{
		count16 = 0;
		count17 = 0;
		count18 = 0;
	}

{
if(($1=="+") && ($3 =="4"))
	count16++;

if(($1=="+") &&($3 =="8"))
	count17++;

if(($1=="+") && ($3 =="12"))
	count18++;
}


END	{
		printf("No.of packets enqueued at node 4= %d \n", count16);
		printf("No.of packets enqueued at node 8= %d \n", count17);
		printf("No.of packets enqueued at node 12= %d \n", count18);
	}
