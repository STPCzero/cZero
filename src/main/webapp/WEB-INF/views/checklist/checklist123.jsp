<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		@media screen and (width: 500px) {
			fieldset div{
				max-width: 70em;margin-left: 50px;;
			}
		}
	</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:200,300,400,500,600,700" rel="stylesheet">
</head>
<body>

<!-- HEADER =============================-->
<header class="item header margin-top-0">
	<div class="wrapper">
		<nav role="navigation" class="navbar navbar-white navbar-embossed navbar-lg navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button data-target="#navbar-collapse-02" data-toggle="collapse" class="navbar-toggle" type="button">
						<i class="fa fa-bars"></i>
						<span class="sr-only">Toggle navigation</span>
					</button>
					<img src="/images/Czero.png" style="width: 135px; height: 60px; margin-top: 5px" alt="로고">
				</div>
				<div id="navbar-collapse-02" class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li class="propClone"><a href="/index">Home</a></li>
						<li class="propClone"><a href="/market/market-list">Market</a></li>
						<li class="propClone"><a href="/checklist/checklist">Checklist</a></li>
						<li class="propClone"><a href="api">Bicycle</a></li>
						<li class="propClone"><a href="/mypage/myinfo">Mypage</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<div class="text-pageheader">
						<div class="subtext-image" data-scrollreveal="enter bottom over 1.7s after 0.1s">
							Check List
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- CONTENT =============================-->

<main id="todolist">
	<h1>
		Todo List
		<span>Get things done, one item at a time.</span>
	</h1>

	<template v-if="todo.length">
		<transition-group name="todolist" tag="ul">
			<li v-for="item in todoByStatus" v-bind:class="item.done ? 'done' : ''" v-bind:key="item.id">
				<span class="label">{{item.label}}</span>
				<div class="actions">
					<button class="btn-picto" type="button" v-on:click="markAsDoneOrUndone(item)" v-bind:aria-label="item.done ? 'Undone' : 'Done'" v-bind:title="item.done ? 'Undone' : 'Done'">
						<i aria-hidden="true" class="material-icons">{{ item.done ? 'check_box' : 'check_box_outline_blank' }}</i>
					</button>
					<button class="btn-picto" type="button" v-on:click="deleteItemFromList(item)" aria-label="Delete" title="Delete">
						<i aria-hidden="true" class="material-icons">delete</i>
					</button>
				</div>
			</li>
		</transition-group>
		<togglebutton
				label="Move done items at the end?"
				name="todosort"
				v-on:clicked="clickontoogle" />
	</template>
	<p v-else class="emptylist">Your todo list is empty.</p>

	<form name="newform" v-on:submit.prevent="addItem">
		<label for="newitem">Add to the todo list</label>
		<input type="text" name="newitem" id="newitem" v-model="newitem">
		<button type="submit">Add item</button>
	</form>
</main>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script>
	Vue.component('togglebutton', {
		props: ['label', 'name'],
		template: `<div class="togglebutton-wrapper" v-bind:class="isactive ? 'togglebutton-checked' : ''">
      <label v-bind:for="name">
        <span class="togglebutton-label">{{ label }}</span>
        <span class="tooglebutton-box"></span>
      </label>
      <input v-bind:id="name" type="checkbox" v-bind:name="name" v-model="isactive" v-on:change="onToogle">
  </div>`,
		model: {
			prop: 'checked',
			event: 'change'
		},
		data: function() {
			return {
				isactive:false
			}
		},
		methods: {
			onToogle: function() {
				this.$emit('clicked', this.isactive)
			}
		}
	});

	var todolist = new Vue({
		el: '#todolist',    // 어떤 id를 가진 태그에 종속될 것인지?
		data: {
			newitem:'',
			sortByStatus:false,
			todo: [
				{ id:1, label: "Learn VueJs", done: true },
				{ id:2, label: "Code a todo list", done: false },
				{ id:3, label: "Learn something else", done: false }
			]
		},
		methods: {
			addItem: function() {
				this.todo.push({id: Math.floor(Math.random() * 9999) + 10, label: this.newitem, done: false});
				this.newitem = '';
			},
			markAsDoneOrUndone: function(item) {    // 체크하기
				item.done = !item.done;
			},
			deleteItemFromList: function(item) {    // list 에서 체크리스트 지우기
				let index = this.todo.indexOf(item)
				this.todo.splice(index, 1);
			},
			clickontoogle: function(active) {
				this.sortByStatus = active;
			}
		},
		computed: {
			todoByStatus: function() {

				if(!this.sortByStatus) {
					return this.todo;
				}

				var sortedArray = []
				var doneArray = this.todo.filter(function(item) { return item.done; });
				var notDoneArray = this.todo.filter(function(item) { return !item.done; });

				sortedArray = [...notDoneArray, ...doneArray];
				return sortedArray;
			}
		}
	});
</script>
<!-- FOOTER =============================-->
<div class="footer text-center" style="width: 100%; position: fixed; bottom: 0;">
	<div class="container">
		<div class="row">
			<p class="">
				Thanks for visiting our Website.<br>
				Copyright ⓒ 2022. Team.CZero All rights reserved.
			</p>
		</div>
	</div>
</div>

<!-- Load JS here for greater good =============================-->
<script src="js/jquery-.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/anim.js"></script>

</body>
</html>