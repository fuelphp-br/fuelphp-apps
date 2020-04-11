<?php

namespace Fuel\Migrations;

class Create_vendedors
{
	public function up()
	{
		\DBUtil::create_table('vendedors', array(
			'id' => array('type' => 'int', 'unsigned' => true, 'null' => false, 'auto_increment' => true, 'constraint' => '11'),
			'nome' => array('constraint' => 50, 'null' => false, 'type' => 'varchar'),
			'email' => array('constraint' => 50, 'null' => false, 'type' => 'varchar'),
			'cpf' => array('constraint' => 12, 'null' => false, 'type' => 'varchar'),
			'created_at' => array('constraint' => '11', 'null' => false, 'type' => 'int'),
			'updated_at' => array('constraint' => '11', 'null' => false, 'type' => 'int'),
		), array('id'));
	}

	public function down()
	{
		\DBUtil::drop_table('vendedors');
	}
}