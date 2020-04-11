<h2>Listing Vendedors</h2>
<br>

<?php if ($vendedors): ?>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Nome</th>
					<th>Email</th>
					<th>Cpf</th>
					<th></th>
				</tr>
			</thead>

			<tbody>
				<?php foreach ($vendedors as $item): ?>
					<tr>
						<td><?php echo $item->nome; ?></td>
						<td><?php echo $item->email; ?></td>
						<td><?php echo $item->cpf; ?></td>

						<td>
							<?php echo Html::anchor('admin/vendedor/view/'.$item->id, 'View'); ?> |
							<?php echo Html::anchor('admin/vendedor/edit/'.$item->id, 'Edit'); ?> |
							<?php echo Html::anchor('admin/vendedor/delete/'.$item->id, 'Delete', array('onclick' => "return confirm('Are you sure?')")); ?>
						</td>
					</tr>
				<?php endforeach; ?>
			</tbody>
		</table>
	</div>

	<?php echo $pagination ?>
<?php else: ?>
	<p>No Vendedors.</p>
<?php endif; ?>

<p>
	<?php echo Html::anchor('admin/vendedor/create', 'Add new Vendedor', array('class' => 'btn btn-success')); ?>
</p>
