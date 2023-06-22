#!/usr/bin/perl

use DBI;
use CGI;
use JSON qw /encode_json/;

my $db_name  = "test";					#----- ИМЯ БД
my $db_host  = "localhost";				#----- ХОСТ БД
my $db_port  = "3306";					#----- ПОРТ БД
my $db_login = "root";					#----- ЛОГИН БД
my $db_pswd  = "";						#----- ПАРОЛЬ БД

$dbh = DBI->connect("DBI:mysql:$db_name:$db_host:$db_port", "$db_login", "$db_pswd");
$dbh->do("SET CHARACTER SET utf8");

my $query = CGI->new;
my $action = $query->param('action');

print "Content-Type: application/json;\n\n";

if ($action eq 'search') {
	print readdb();
}
elsif ($action eq 'delete') {
	$dbh->do(sprintf("DELETE FROM notepad WHERE id = %s", $dbh->quote($query->param('id'))));
	print readdb();
}
elsif ($action eq 'update') {
	$dbh->do(sprintf("UPDATE notepad SET name = %s, phone = %s WHERE id = %s", 
		$dbh->quote($query->param('name')),
		$dbh->quote($query->param('phone')),
		$dbh->quote($query->param('id')),
	));
	print readdb();
}
elsif ($action eq 'addnew') {
	$dbh->do(sprintf("INSERT INTO notepad (name, phone) VALUES (%s, %s)", 
		$dbh->quote($query->param('name')),
		$dbh->quote($query->param('phone')),
	));
	print readdb();
}

sub readdb {
	$sth = $dbh->prepare("SELECT id, name, phone FROM notepad ORDER BY name");
	$sth->execute();
	my $result = encode_json($sth->fetchall_arrayref);
	$sth->finish;
	return $result;
}

$dbh->disconnect;
