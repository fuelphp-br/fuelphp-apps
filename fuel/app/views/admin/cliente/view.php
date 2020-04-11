<h2>Viewing #<?php echo $cliente->id; ?></h2>
<br>

<dl class="dl-horizontal">
	<dt>Nome</dt>
	<dd><?php echo $cliente->nome; ?></dd>
	<br>
	<dt>Email</dt>
	<dd><?php echo $cliente->email; ?></dd>
	<br>
	<dt>Idade</dt>
	<dd><?php echo $cliente->idade; ?></dd>
	<br>
</dl>

<div class="btn-group">
	<?php echo Html::anchor('admin/cliente/edit/'.$cliente->id, 'Edit', array('class' => 'btn btn-warning')); ?>
	<?php echo Html::anchor('admin/cliente', 'Back', array('class' => 'btn btn-default')); ?>
</div>
