<?php
class Model_Cliente extends \Orm\Model
{
	protected static $_properties = array(
		'id',
		'nome',
		'email',
		'idade',
		'created_at',
		'updated_at',
	);

	protected static $_observers = array(
		'Orm\Observer_CreatedAt' => array(
			'events' => array('before_insert'),
			'mysql_timestamp' => false,
		),
		'Orm\Observer_UpdatedAt' => array(
			'events' => array('before_save'),
			'mysql_timestamp' => false,
		),
	);

	public static function validate($factory)
	{
		$val = Validation::forge($factory);
		$val->add_field('nome', 'Nome', 'required|max_length[50]');
		$val->add_field('email', 'Email', 'required|valid_email|max_length[50]');
		$val->add_field('idade', 'Idade', 'required|valid_string[numeric]');

		return $val;
	}

}
