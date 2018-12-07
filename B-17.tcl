
set ns [new Simulator]

$ns color 1 Blue
$ns color 2 Red
$ns color 3 Green
$ns color 4 Black
$ns color 5 Yellow

set nf [open B17.nam w]
set tf [open B17.tr w]
$ns namtrace-all $nf
$ns trace-all $tf

proc finish {} {
  global ns nf tf
  $ns flush-trace
  close $nf
  close $tf
  exec nam B17.nam &
  exit 0
}

set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
set n6 [$ns node]
set n7 [$ns node]
set n8 [$ns node]
set n9 [$ns node]
set n10 [$ns node]
set n11 [$ns node]
set n12 [$ns node]

set tcp_1 [new Agent/TCP]
$tcp_1 set class_ 1
$ns attach-agent $n1 $tcp_1

set sink_1 [new Agent/TCPSink]
$ns attach-agent $n6 $sink_1
$ns connect $tcp_1 $sink_1

set tcp_2 [new Agent/TCP]
$tcp_2 set class_ 2
$ns attach-agent $n2 $tcp_2

set sink_2 [new Agent/TCPSink]
$ns attach-agent $n10 $sink_2
$ns connect $tcp_2 $sink_2

set udp_3 [new Agent/UDP]
$ns attach-agent $n7 $udp_3
set cbr_3 [new Application/Traffic/CBR]
$cbr_3 set packetSize_ 500
$cbr_3 set interval_ 0.005
$cbr_3 attach-agent $udp_3

set udp_4 [new Agent/UDP]
$ns attach-agent $n11 $udp_4
set cbr_4 [new Application/Traffic/CBR]
$cbr_4 set packetSize_ 500
$cbr_4 set interval_ 0.005
$cbr_4 attach-agent $udp_4

set tcp_5 [new Agent/TCP]
$tcp_5 set class_ 3
$ns attach-agent $n9 $tcp_5

set sink_5 [new Agent/TCPSink]
$ns attach-agent $n10 $sink_5
$ns connect $tcp_5 $sink_5

set ftp_1 [new Application/FTP]
$ftp_1 attach-agent $tcp_1

set ftp_2 [new Application/FTP]
$ftp_2 attach-agent $tcp_2

set null1 [new Agent/Null]
$ns attach-agent $n3 $null1
$udp_3 set class_ 4
$ns connect $udp_3 $null1

set null2 [new Agent/Null]
$ns attach-agent $n5 $null2
$udp_4 set class_ 5
$ns connect $udp_4 $null2

set ftp_5 [new Application/FTP]
$ftp_5 attach-agent $tcp_5


$ns duplex-link $n1 $n4 1Mb 10ms DropTail
$ns duplex-link $n2 $n4 1Mb 10ms DropTail
$ns duplex-link $n3 $n4 1Mb 10ms DropTail
$ns duplex-link $n4 $n8 1Mb 10ms DropTail
$ns duplex-link $n5 $n8 1Mb 10ms DropTail
$ns duplex-link $n6 $n8 1Mb 10ms DropTail
$ns duplex-link $n7 $n8 1Mb 10ms DropTail
$ns duplex-link $n8 $n12 1Mb 10ms DropTail
$ns duplex-link $n9 $n12 1Mb 10ms DropTail
$ns duplex-link $n10 $n12 1Mb 10ms DropTail
$ns duplex-link $n11 $n12 1Mb 10ms DropTail


$ns at 0.5 "$cbr_3 start"
$ns at 0.5 "$cbr_4 start"
$ns at 0.8 "$ftp_1 start"
$ns at 1.0 "$ftp_2 start"
$ns at 4.0 "$ftp_2 stop"
$ns at 5.0 "$ftp_5 start"
$ns at 7.0 "$cbr_4 stop"
$ns at 8.0 "$cbr_3 stop"
$ns at 8.0 "$ftp_5 stop"
$ns at 10.0 "$ftp_1 stop" 
$ns at 12.0 "finish"
$ns run

