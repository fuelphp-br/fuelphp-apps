<h2>Viewing #<?php echo $vendedor->id; ?></h2>
<br>

<dl class="dl-horizontal">
	<dt>Nome</dt>
	<dd><?php echo $vendedor->nome; ?></dd>
	<br>
	<dt>Email</dt>
	<dd><?php echo $vendedor->email; ?></dd>
	<br>
	<dt>Cpf</dt>
	<dd><?php echo $vendedor->cpf; ?></dd>
	<br>
</dl>

<div class="btn-group">
	<?php echo Html::anchor('admin/vendedor/edit/'.$vendedor->id, 'Edit', array('class' => 'btn btn-warning')); ?>
	<?php echo Html::anchor('admin/vendedor', 'Back', array('class' => 'btn btn-default')); ?>
</div>
