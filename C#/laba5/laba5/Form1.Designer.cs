namespace laba5
{
    partial class Form1
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.Purchases = new System.Windows.Forms.DataGridView();
            this.codepurchaseDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.codebookDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dateorderDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.codedeliveryDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.typepurchaseDataGridViewCheckBoxColumn = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.costDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.amountDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.purchasesBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.dB_BOOKSDataSet = new laba5.DB_BOOKSDataSet();
            this.booksBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.dB_BOOKSDataSet1 = new laba5.DB_BOOKSDataSet1();
            this.Authors = new System.Windows.Forms.DataGridView();
            this.codeauthorDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nameauthorDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.birthdayDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.authorsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.dB_BOOKSDataSet2 = new laba5.DB_BOOKSDataSet2();
            this.Deliveries = new System.Windows.Forms.DataGridView();
            this.codedeliveryDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.namedeliveryDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.namecompanyDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.addressDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.phoneDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.iNNDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.deliveriesBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.dB_BOOKSDataSet3 = new laba5.DB_BOOKSDataSet3();
            this.Publish = new System.Windows.Forms.DataGridView();
            this.codepublishDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.publishDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cityDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.publishinghouseBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.dB_BOOKSDataSet4 = new laba5.DB_BOOKSDataSet4();
            this.purchasesTableAdapter = new laba5.DB_BOOKSDataSetTableAdapters.PurchasesTableAdapter();
            this.booksTableAdapter = new laba5.DB_BOOKSDataSet1TableAdapters.BooksTableAdapter();
            this.authorsTableAdapter = new laba5.DB_BOOKSDataSet2TableAdapters.AuthorsTableAdapter();
            this.deliveriesTableAdapter = new laba5.DB_BOOKSDataSet3TableAdapters.DeliveriesTableAdapter();
            this.publishing_houseTableAdapter = new laba5.DB_BOOKSDataSet4TableAdapters.Publishing_houseTableAdapter();
            this.dB_BOOKSDataSet5 = new laba5.DB_BOOKSDataSet5();
            this.booksBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.booksTableAdapter1 = new laba5.DB_BOOKSDataSet5TableAdapters.BooksTableAdapter();
            this.dB_BOOKSDataSet6 = new laba5.DB_BOOKSDataSet6();
            this.booksBindingSource2 = new System.Windows.Forms.BindingSource(this.components);
            this.booksTableAdapter2 = new laba5.DB_BOOKSDataSet6TableAdapters.BooksTableAdapter();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.работаСТабицамиToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.авторыToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.книгиToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.издательстваToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.поставщикиToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.поставкиToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.работаСПроцедурамиToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.администрированиеToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.отчётыToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.отчётВТабличнойФормеToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.отчётВСвободнойФормеToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.отчётВToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.dB_BOOKSDataSet7 = new laba5.DB_BOOKSDataSet();
            this.book = new System.Windows.Forms.DataGridView();
            this.codebookDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.titlebookDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.codeauthorDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pagesDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.codepublishDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.report1 = new FastReport.Report();
            this.report2 = new FastReport.Report();
            this.report3 = new FastReport.Report();
            ((System.ComponentModel.ISupportInitialize)(this.Purchases)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.purchasesBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dB_BOOKSDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.booksBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dB_BOOKSDataSet1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Authors)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.authorsBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dB_BOOKSDataSet2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Deliveries)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.deliveriesBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dB_BOOKSDataSet3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Publish)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.publishinghouseBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dB_BOOKSDataSet4)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dB_BOOKSDataSet5)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.booksBindingSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dB_BOOKSDataSet6)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.booksBindingSource2)).BeginInit();
            this.menuStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dB_BOOKSDataSet7)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.book)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.report1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.report2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.report3)).BeginInit();
            this.SuspendLayout();
            // 
            // Purchases
            // 
            this.Purchases.AutoGenerateColumns = false;
            this.Purchases.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.Purchases.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.codepurchaseDataGridViewTextBoxColumn,
            this.codebookDataGridViewTextBoxColumn,
            this.dateorderDataGridViewTextBoxColumn,
            this.codedeliveryDataGridViewTextBoxColumn,
            this.typepurchaseDataGridViewCheckBoxColumn,
            this.costDataGridViewTextBoxColumn,
            this.amountDataGridViewTextBoxColumn});
            this.Purchases.DataSource = this.purchasesBindingSource;
            this.Purchases.Location = new System.Drawing.Point(7, 35);
            this.Purchases.Name = "Purchases";
            this.Purchases.RowHeadersWidth = 51;
            this.Purchases.RowTemplate.Height = 24;
            this.Purchases.Size = new System.Drawing.Size(1271, 119);
            this.Purchases.TabIndex = 0;
            this.Purchases.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.Purchases_CellContentClick);
            // 
            // codepurchaseDataGridViewTextBoxColumn
            // 
            this.codepurchaseDataGridViewTextBoxColumn.DataPropertyName = "Code_purchase";
            this.codepurchaseDataGridViewTextBoxColumn.HeaderText = "Code_purchase";
            this.codepurchaseDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.codepurchaseDataGridViewTextBoxColumn.Name = "codepurchaseDataGridViewTextBoxColumn";
            this.codepurchaseDataGridViewTextBoxColumn.Width = 125;
            // 
            // codebookDataGridViewTextBoxColumn
            // 
            this.codebookDataGridViewTextBoxColumn.DataPropertyName = "Code_book";
            this.codebookDataGridViewTextBoxColumn.HeaderText = "Code_book";
            this.codebookDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.codebookDataGridViewTextBoxColumn.Name = "codebookDataGridViewTextBoxColumn";
            this.codebookDataGridViewTextBoxColumn.Width = 125;
            // 
            // dateorderDataGridViewTextBoxColumn
            // 
            this.dateorderDataGridViewTextBoxColumn.DataPropertyName = "Date_order";
            this.dateorderDataGridViewTextBoxColumn.HeaderText = "Date_order";
            this.dateorderDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.dateorderDataGridViewTextBoxColumn.Name = "dateorderDataGridViewTextBoxColumn";
            this.dateorderDataGridViewTextBoxColumn.Width = 125;
            // 
            // codedeliveryDataGridViewTextBoxColumn
            // 
            this.codedeliveryDataGridViewTextBoxColumn.DataPropertyName = "Code_delivery";
            this.codedeliveryDataGridViewTextBoxColumn.HeaderText = "Code_delivery";
            this.codedeliveryDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.codedeliveryDataGridViewTextBoxColumn.Name = "codedeliveryDataGridViewTextBoxColumn";
            this.codedeliveryDataGridViewTextBoxColumn.Width = 125;
            // 
            // typepurchaseDataGridViewCheckBoxColumn
            // 
            this.typepurchaseDataGridViewCheckBoxColumn.DataPropertyName = "Type_purchase";
            this.typepurchaseDataGridViewCheckBoxColumn.HeaderText = "Type_purchase";
            this.typepurchaseDataGridViewCheckBoxColumn.MinimumWidth = 6;
            this.typepurchaseDataGridViewCheckBoxColumn.Name = "typepurchaseDataGridViewCheckBoxColumn";
            this.typepurchaseDataGridViewCheckBoxColumn.Width = 125;
            // 
            // costDataGridViewTextBoxColumn
            // 
            this.costDataGridViewTextBoxColumn.DataPropertyName = "Cost";
            this.costDataGridViewTextBoxColumn.HeaderText = "Cost";
            this.costDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.costDataGridViewTextBoxColumn.Name = "costDataGridViewTextBoxColumn";
            this.costDataGridViewTextBoxColumn.Width = 125;
            // 
            // amountDataGridViewTextBoxColumn
            // 
            this.amountDataGridViewTextBoxColumn.DataPropertyName = "Amount";
            this.amountDataGridViewTextBoxColumn.HeaderText = "Amount";
            this.amountDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.amountDataGridViewTextBoxColumn.Name = "amountDataGridViewTextBoxColumn";
            this.amountDataGridViewTextBoxColumn.Width = 125;
            // 
            // purchasesBindingSource
            // 
            this.purchasesBindingSource.DataMember = "Purchases";
            this.purchasesBindingSource.DataSource = this.dB_BOOKSDataSet;
            // 
            // dB_BOOKSDataSet
            // 
            this.dB_BOOKSDataSet.DataSetName = "DB_BOOKSDataSet";
            this.dB_BOOKSDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // booksBindingSource
            // 
            this.booksBindingSource.DataMember = "Books";
            this.booksBindingSource.DataSource = this.dB_BOOKSDataSet1;
            // 
            // dB_BOOKSDataSet1
            // 
            this.dB_BOOKSDataSet1.DataSetName = "DB_BOOKSDataSet1";
            this.dB_BOOKSDataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // Authors
            // 
            this.Authors.AutoGenerateColumns = false;
            this.Authors.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.Authors.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.codeauthorDataGridViewTextBoxColumn,
            this.nameauthorDataGridViewTextBoxColumn,
            this.birthdayDataGridViewTextBoxColumn});
            this.Authors.DataSource = this.authorsBindingSource;
            this.Authors.Location = new System.Drawing.Point(7, 278);
            this.Authors.Name = "Authors";
            this.Authors.RowHeadersWidth = 51;
            this.Authors.RowTemplate.Height = 24;
            this.Authors.Size = new System.Drawing.Size(1271, 104);
            this.Authors.TabIndex = 2;
            this.Authors.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView3_CellContentClick);
            // 
            // codeauthorDataGridViewTextBoxColumn
            // 
            this.codeauthorDataGridViewTextBoxColumn.DataPropertyName = "Code_author";
            this.codeauthorDataGridViewTextBoxColumn.HeaderText = "Code_author";
            this.codeauthorDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.codeauthorDataGridViewTextBoxColumn.Name = "codeauthorDataGridViewTextBoxColumn";
            this.codeauthorDataGridViewTextBoxColumn.Width = 125;
            // 
            // nameauthorDataGridViewTextBoxColumn
            // 
            this.nameauthorDataGridViewTextBoxColumn.DataPropertyName = "name_author";
            this.nameauthorDataGridViewTextBoxColumn.HeaderText = "name_author";
            this.nameauthorDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.nameauthorDataGridViewTextBoxColumn.Name = "nameauthorDataGridViewTextBoxColumn";
            this.nameauthorDataGridViewTextBoxColumn.Width = 125;
            // 
            // birthdayDataGridViewTextBoxColumn
            // 
            this.birthdayDataGridViewTextBoxColumn.DataPropertyName = "Birthday";
            this.birthdayDataGridViewTextBoxColumn.HeaderText = "Birthday";
            this.birthdayDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.birthdayDataGridViewTextBoxColumn.Name = "birthdayDataGridViewTextBoxColumn";
            this.birthdayDataGridViewTextBoxColumn.Width = 125;
            // 
            // authorsBindingSource
            // 
            this.authorsBindingSource.DataMember = "Authors";
            this.authorsBindingSource.DataSource = this.dB_BOOKSDataSet2;
            // 
            // dB_BOOKSDataSet2
            // 
            this.dB_BOOKSDataSet2.DataSetName = "DB_BOOKSDataSet2";
            this.dB_BOOKSDataSet2.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // Deliveries
            // 
            this.Deliveries.AutoGenerateColumns = false;
            this.Deliveries.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.Deliveries.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.codedeliveryDataGridViewTextBoxColumn1,
            this.namedeliveryDataGridViewTextBoxColumn,
            this.namecompanyDataGridViewTextBoxColumn,
            this.addressDataGridViewTextBoxColumn,
            this.phoneDataGridViewTextBoxColumn,
            this.iNNDataGridViewTextBoxColumn});
            this.Deliveries.DataSource = this.deliveriesBindingSource;
            this.Deliveries.Location = new System.Drawing.Point(7, 388);
            this.Deliveries.Name = "Deliveries";
            this.Deliveries.RowHeadersWidth = 51;
            this.Deliveries.RowTemplate.Height = 24;
            this.Deliveries.Size = new System.Drawing.Size(1271, 108);
            this.Deliveries.TabIndex = 3;
            // 
            // codedeliveryDataGridViewTextBoxColumn1
            // 
            this.codedeliveryDataGridViewTextBoxColumn1.DataPropertyName = "Code_delivery";
            this.codedeliveryDataGridViewTextBoxColumn1.HeaderText = "Code_delivery";
            this.codedeliveryDataGridViewTextBoxColumn1.MinimumWidth = 6;
            this.codedeliveryDataGridViewTextBoxColumn1.Name = "codedeliveryDataGridViewTextBoxColumn1";
            this.codedeliveryDataGridViewTextBoxColumn1.Width = 125;
            // 
            // namedeliveryDataGridViewTextBoxColumn
            // 
            this.namedeliveryDataGridViewTextBoxColumn.DataPropertyName = "Name_delivery";
            this.namedeliveryDataGridViewTextBoxColumn.HeaderText = "Name_delivery";
            this.namedeliveryDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.namedeliveryDataGridViewTextBoxColumn.Name = "namedeliveryDataGridViewTextBoxColumn";
            this.namedeliveryDataGridViewTextBoxColumn.Width = 125;
            // 
            // namecompanyDataGridViewTextBoxColumn
            // 
            this.namecompanyDataGridViewTextBoxColumn.DataPropertyName = "Name_company";
            this.namecompanyDataGridViewTextBoxColumn.HeaderText = "Name_company";
            this.namecompanyDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.namecompanyDataGridViewTextBoxColumn.Name = "namecompanyDataGridViewTextBoxColumn";
            this.namecompanyDataGridViewTextBoxColumn.Width = 125;
            // 
            // addressDataGridViewTextBoxColumn
            // 
            this.addressDataGridViewTextBoxColumn.DataPropertyName = "Address";
            this.addressDataGridViewTextBoxColumn.HeaderText = "Address";
            this.addressDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.addressDataGridViewTextBoxColumn.Name = "addressDataGridViewTextBoxColumn";
            this.addressDataGridViewTextBoxColumn.Width = 125;
            // 
            // phoneDataGridViewTextBoxColumn
            // 
            this.phoneDataGridViewTextBoxColumn.DataPropertyName = "Phone";
            this.phoneDataGridViewTextBoxColumn.HeaderText = "Phone";
            this.phoneDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.phoneDataGridViewTextBoxColumn.Name = "phoneDataGridViewTextBoxColumn";
            this.phoneDataGridViewTextBoxColumn.Width = 125;
            // 
            // iNNDataGridViewTextBoxColumn
            // 
            this.iNNDataGridViewTextBoxColumn.DataPropertyName = "INN";
            this.iNNDataGridViewTextBoxColumn.HeaderText = "INN";
            this.iNNDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.iNNDataGridViewTextBoxColumn.Name = "iNNDataGridViewTextBoxColumn";
            this.iNNDataGridViewTextBoxColumn.Width = 125;
            // 
            // deliveriesBindingSource
            // 
            this.deliveriesBindingSource.DataMember = "Deliveries";
            this.deliveriesBindingSource.DataSource = this.dB_BOOKSDataSet3;
            // 
            // dB_BOOKSDataSet3
            // 
            this.dB_BOOKSDataSet3.DataSetName = "DB_BOOKSDataSet3";
            this.dB_BOOKSDataSet3.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // Publish
            // 
            this.Publish.AutoGenerateColumns = false;
            this.Publish.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.Publish.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.codepublishDataGridViewTextBoxColumn,
            this.publishDataGridViewTextBoxColumn,
            this.cityDataGridViewTextBoxColumn});
            this.Publish.DataSource = this.publishinghouseBindingSource;
            this.Publish.Location = new System.Drawing.Point(7, 502);
            this.Publish.Name = "Publish";
            this.Publish.RowHeadersWidth = 51;
            this.Publish.RowTemplate.Height = 24;
            this.Publish.Size = new System.Drawing.Size(1271, 101);
            this.Publish.TabIndex = 4;
            // 
            // codepublishDataGridViewTextBoxColumn
            // 
            this.codepublishDataGridViewTextBoxColumn.DataPropertyName = "Code_publish";
            this.codepublishDataGridViewTextBoxColumn.HeaderText = "Code_publish";
            this.codepublishDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.codepublishDataGridViewTextBoxColumn.Name = "codepublishDataGridViewTextBoxColumn";
            this.codepublishDataGridViewTextBoxColumn.Width = 125;
            // 
            // publishDataGridViewTextBoxColumn
            // 
            this.publishDataGridViewTextBoxColumn.DataPropertyName = "Publish";
            this.publishDataGridViewTextBoxColumn.HeaderText = "Publish";
            this.publishDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.publishDataGridViewTextBoxColumn.Name = "publishDataGridViewTextBoxColumn";
            this.publishDataGridViewTextBoxColumn.Width = 125;
            // 
            // cityDataGridViewTextBoxColumn
            // 
            this.cityDataGridViewTextBoxColumn.DataPropertyName = "City";
            this.cityDataGridViewTextBoxColumn.HeaderText = "City";
            this.cityDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.cityDataGridViewTextBoxColumn.Name = "cityDataGridViewTextBoxColumn";
            this.cityDataGridViewTextBoxColumn.Width = 125;
            // 
            // publishinghouseBindingSource
            // 
            this.publishinghouseBindingSource.DataMember = "Publishing_house";
            this.publishinghouseBindingSource.DataSource = this.dB_BOOKSDataSet4;
            // 
            // dB_BOOKSDataSet4
            // 
            this.dB_BOOKSDataSet4.DataSetName = "DB_BOOKSDataSet4";
            this.dB_BOOKSDataSet4.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // purchasesTableAdapter
            // 
            this.purchasesTableAdapter.ClearBeforeFill = true;
            // 
            // booksTableAdapter
            // 
            this.booksTableAdapter.ClearBeforeFill = true;
            // 
            // authorsTableAdapter
            // 
            this.authorsTableAdapter.ClearBeforeFill = true;
            // 
            // deliveriesTableAdapter
            // 
            this.deliveriesTableAdapter.ClearBeforeFill = true;
            // 
            // publishing_houseTableAdapter
            // 
            this.publishing_houseTableAdapter.ClearBeforeFill = true;
            // 
            // dB_BOOKSDataSet5
            // 
            this.dB_BOOKSDataSet5.DataSetName = "DB_BOOKSDataSet5";
            this.dB_BOOKSDataSet5.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // booksBindingSource1
            // 
            this.booksBindingSource1.DataMember = "Books";
            this.booksBindingSource1.DataSource = this.dB_BOOKSDataSet5;
            // 
            // booksTableAdapter1
            // 
            this.booksTableAdapter1.ClearBeforeFill = true;
            // 
            // dB_BOOKSDataSet6
            // 
            this.dB_BOOKSDataSet6.DataSetName = "DB_BOOKSDataSet6";
            this.dB_BOOKSDataSet6.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // booksBindingSource2
            // 
            this.booksBindingSource2.DataMember = "Books";
            this.booksBindingSource2.DataSource = this.dB_BOOKSDataSet6;
            // 
            // booksTableAdapter2
            // 
            this.booksTableAdapter2.ClearBeforeFill = true;
            // 
            // menuStrip1
            // 
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.работаСТабицамиToolStripMenuItem,
            this.отчётыToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(1260, 28);
            this.menuStrip1.TabIndex = 5;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // работаСТабицамиToolStripMenuItem
            // 
            this.работаСТабицамиToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.авторыToolStripMenuItem,
            this.книгиToolStripMenuItem,
            this.издательстваToolStripMenuItem,
            this.поставщикиToolStripMenuItem,
            this.поставкиToolStripMenuItem,
            this.работаСПроцедурамиToolStripMenuItem,
            this.администрированиеToolStripMenuItem});
            this.работаСТабицамиToolStripMenuItem.Name = "работаСТабицамиToolStripMenuItem";
            this.работаСТабицамиToolStripMenuItem.Size = new System.Drawing.Size(163, 24);
            this.работаСТабицамиToolStripMenuItem.Text = "Работа с таблицами";
            this.работаСТабицамиToolStripMenuItem.Click += new System.EventHandler(this.работаСТабицамиToolStripMenuItem_Click);
            // 
            // авторыToolStripMenuItem
            // 
            this.авторыToolStripMenuItem.Name = "авторыToolStripMenuItem";
            this.авторыToolStripMenuItem.Size = new System.Drawing.Size(251, 26);
            this.авторыToolStripMenuItem.Text = "Авторы";
            this.авторыToolStripMenuItem.Click += new System.EventHandler(this.авторыToolStripMenuItem_Click);
            // 
            // книгиToolStripMenuItem
            // 
            this.книгиToolStripMenuItem.Name = "книгиToolStripMenuItem";
            this.книгиToolStripMenuItem.Size = new System.Drawing.Size(251, 26);
            this.книгиToolStripMenuItem.Text = "Книги";
            this.книгиToolStripMenuItem.Click += new System.EventHandler(this.книгиToolStripMenuItem_Click);
            // 
            // издательстваToolStripMenuItem
            // 
            this.издательстваToolStripMenuItem.Name = "издательстваToolStripMenuItem";
            this.издательстваToolStripMenuItem.Size = new System.Drawing.Size(251, 26);
            this.издательстваToolStripMenuItem.Text = "Издательства";
            this.издательстваToolStripMenuItem.Click += new System.EventHandler(this.издательстваToolStripMenuItem_Click);
            // 
            // поставщикиToolStripMenuItem
            // 
            this.поставщикиToolStripMenuItem.Name = "поставщикиToolStripMenuItem";
            this.поставщикиToolStripMenuItem.Size = new System.Drawing.Size(251, 26);
            this.поставщикиToolStripMenuItem.Text = "Поставщики";
            this.поставщикиToolStripMenuItem.Click += new System.EventHandler(this.поставщикиToolStripMenuItem_Click);
            // 
            // поставкиToolStripMenuItem
            // 
            this.поставкиToolStripMenuItem.Name = "поставкиToolStripMenuItem";
            this.поставкиToolStripMenuItem.Size = new System.Drawing.Size(251, 26);
            this.поставкиToolStripMenuItem.Text = "Поставки";
            this.поставкиToolStripMenuItem.Click += new System.EventHandler(this.поставкиToolStripMenuItem_Click);
            // 
            // работаСПроцедурамиToolStripMenuItem
            // 
            this.работаСПроцедурамиToolStripMenuItem.Name = "работаСПроцедурамиToolStripMenuItem";
            this.работаСПроцедурамиToolStripMenuItem.Size = new System.Drawing.Size(251, 26);
            this.работаСПроцедурамиToolStripMenuItem.Text = "Работа с процедурами";
            this.работаСПроцедурамиToolStripMenuItem.Click += new System.EventHandler(this.работаСПроцедурамиToolStripMenuItem_Click);
            // 
            // администрированиеToolStripMenuItem
            // 
            this.администрированиеToolStripMenuItem.Name = "администрированиеToolStripMenuItem";
            this.администрированиеToolStripMenuItem.Size = new System.Drawing.Size(251, 26);
            this.администрированиеToolStripMenuItem.Text = "Администрирование";
            this.администрированиеToolStripMenuItem.Click += new System.EventHandler(this.администрированиеToolStripMenuItem_Click);
            // 
            // отчётыToolStripMenuItem
            // 
            this.отчётыToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.отчётВТабличнойФормеToolStripMenuItem,
            this.отчётВСвободнойФормеToolStripMenuItem,
            this.отчётВToolStripMenuItem});
            this.отчётыToolStripMenuItem.Name = "отчётыToolStripMenuItem";
            this.отчётыToolStripMenuItem.Size = new System.Drawing.Size(73, 24);
            this.отчётыToolStripMenuItem.Text = "Отчёты";
            // 
            // отчётВТабличнойФормеToolStripMenuItem
            // 
            this.отчётВТабличнойФормеToolStripMenuItem.Name = "отчётВТабличнойФормеToolStripMenuItem";
            this.отчётВТабличнойФормеToolStripMenuItem.Size = new System.Drawing.Size(382, 26);
            this.отчётВТабличнойФормеToolStripMenuItem.Text = "Отчёт в табличной форме";
            // 
            // отчётВСвободнойФормеToolStripMenuItem
            // 
            this.отчётВСвободнойФормеToolStripMenuItem.Name = "отчётВСвободнойФормеToolStripMenuItem";
            this.отчётВСвободнойФормеToolStripMenuItem.Size = new System.Drawing.Size(382, 26);
            this.отчётВСвободнойФормеToolStripMenuItem.Text = "Отчёт в свободной форме";
            // 
            // отчётВToolStripMenuItem
            // 
            this.отчётВToolStripMenuItem.Name = "отчётВToolStripMenuItem";
            this.отчётВToolStripMenuItem.Size = new System.Drawing.Size(382, 26);
            this.отчётВToolStripMenuItem.Text = "Отчёт с группировкой по двум таблицам ";
            // 
            // dB_BOOKSDataSet7
            // 
            this.dB_BOOKSDataSet7.DataSetName = "DB_BOOKSDataSet";
            this.dB_BOOKSDataSet7.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // book
            // 
            this.book.AutoGenerateColumns = false;
            this.book.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.book.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.codebookDataGridViewTextBoxColumn1,
            this.titlebookDataGridViewTextBoxColumn,
            this.codeauthorDataGridViewTextBoxColumn1,
            this.pagesDataGridViewTextBoxColumn,
            this.codepublishDataGridViewTextBoxColumn1});
            this.book.DataSource = this.booksBindingSource;
            this.book.Location = new System.Drawing.Point(7, 160);
            this.book.Name = "book";
            this.book.RowHeadersWidth = 51;
            this.book.RowTemplate.Height = 24;
            this.book.Size = new System.Drawing.Size(1271, 112);
            this.book.TabIndex = 6;
            // 
            // codebookDataGridViewTextBoxColumn1
            // 
            this.codebookDataGridViewTextBoxColumn1.DataPropertyName = "Code_book";
            this.codebookDataGridViewTextBoxColumn1.HeaderText = "Code_book";
            this.codebookDataGridViewTextBoxColumn1.MinimumWidth = 6;
            this.codebookDataGridViewTextBoxColumn1.Name = "codebookDataGridViewTextBoxColumn1";
            this.codebookDataGridViewTextBoxColumn1.Width = 125;
            // 
            // titlebookDataGridViewTextBoxColumn
            // 
            this.titlebookDataGridViewTextBoxColumn.DataPropertyName = "Title_book";
            this.titlebookDataGridViewTextBoxColumn.HeaderText = "Title_book";
            this.titlebookDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.titlebookDataGridViewTextBoxColumn.Name = "titlebookDataGridViewTextBoxColumn";
            this.titlebookDataGridViewTextBoxColumn.Width = 125;
            // 
            // codeauthorDataGridViewTextBoxColumn1
            // 
            this.codeauthorDataGridViewTextBoxColumn1.DataPropertyName = "Code_author";
            this.codeauthorDataGridViewTextBoxColumn1.HeaderText = "Code_author";
            this.codeauthorDataGridViewTextBoxColumn1.MinimumWidth = 6;
            this.codeauthorDataGridViewTextBoxColumn1.Name = "codeauthorDataGridViewTextBoxColumn1";
            this.codeauthorDataGridViewTextBoxColumn1.Width = 125;
            // 
            // pagesDataGridViewTextBoxColumn
            // 
            this.pagesDataGridViewTextBoxColumn.DataPropertyName = "Pages";
            this.pagesDataGridViewTextBoxColumn.HeaderText = "Pages";
            this.pagesDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.pagesDataGridViewTextBoxColumn.Name = "pagesDataGridViewTextBoxColumn";
            this.pagesDataGridViewTextBoxColumn.Width = 125;
            // 
            // codepublishDataGridViewTextBoxColumn1
            // 
            this.codepublishDataGridViewTextBoxColumn1.DataPropertyName = "Code_publish";
            this.codepublishDataGridViewTextBoxColumn1.HeaderText = "Code_publish";
            this.codepublishDataGridViewTextBoxColumn1.MinimumWidth = 6;
            this.codepublishDataGridViewTextBoxColumn1.Name = "codepublishDataGridViewTextBoxColumn1";
            this.codepublishDataGridViewTextBoxColumn1.Width = 125;
            // 
            // report1
            // 
            this.report1.NeedRefresh = false;
            this.report1.ReportResourceString = resources.GetString("report1.ReportResourceString");
            this.report1.Tag = null;
            this.report1.RegisterData(this.dB_BOOKSDataSet7, "dB_BOOKSDataSet7");
            // 
            // report2
            // 
            this.report2.NeedRefresh = false;
            this.report2.ReportResourceString = resources.GetString("report2.ReportResourceString");
            this.report2.Tag = null;
            // 
            // report3
            // 
            this.report3.NeedRefresh = false;
            this.report3.ReportResourceString = resources.GetString("report3.ReportResourceString");
            this.report3.Tag = null;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1260, 628);
            this.Controls.Add(this.book);
            this.Controls.Add(this.Publish);
            this.Controls.Add(this.Deliveries);
            this.Controls.Add(this.Authors);
            this.Controls.Add(this.Purchases);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.Purchases)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.purchasesBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dB_BOOKSDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.booksBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dB_BOOKSDataSet1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Authors)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.authorsBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dB_BOOKSDataSet2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Deliveries)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.deliveriesBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dB_BOOKSDataSet3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Publish)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.publishinghouseBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dB_BOOKSDataSet4)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dB_BOOKSDataSet5)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.booksBindingSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dB_BOOKSDataSet6)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.booksBindingSource2)).EndInit();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dB_BOOKSDataSet7)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.book)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.report1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.report2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.report3)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView Purchases;
        private System.Windows.Forms.DataGridView Authors;
        private System.Windows.Forms.DataGridView Deliveries;
        private System.Windows.Forms.DataGridView Publish;
        private DB_BOOKSDataSet dB_BOOKSDataSet;
        private System.Windows.Forms.BindingSource purchasesBindingSource;
        private DB_BOOKSDataSetTableAdapters.PurchasesTableAdapter purchasesTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn codepurchaseDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn codebookDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn dateorderDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn codedeliveryDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewCheckBoxColumn typepurchaseDataGridViewCheckBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn costDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn amountDataGridViewTextBoxColumn;
        private DB_BOOKSDataSet1 dB_BOOKSDataSet1;
        private System.Windows.Forms.BindingSource booksBindingSource;
        private DB_BOOKSDataSet1TableAdapters.BooksTableAdapter booksTableAdapter;
        private DB_BOOKSDataSet2 dB_BOOKSDataSet2;
        private System.Windows.Forms.BindingSource authorsBindingSource;
        private DB_BOOKSDataSet2TableAdapters.AuthorsTableAdapter authorsTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn codeauthorDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameauthorDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn birthdayDataGridViewTextBoxColumn;
        private DB_BOOKSDataSet3 dB_BOOKSDataSet3;
        private System.Windows.Forms.BindingSource deliveriesBindingSource;
        private DB_BOOKSDataSet3TableAdapters.DeliveriesTableAdapter deliveriesTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn codedeliveryDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn namedeliveryDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn namecompanyDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn addressDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn phoneDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn iNNDataGridViewTextBoxColumn;
        private DB_BOOKSDataSet4 dB_BOOKSDataSet4;
        private System.Windows.Forms.BindingSource publishinghouseBindingSource;
        private DB_BOOKSDataSet4TableAdapters.Publishing_houseTableAdapter publishing_houseTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn codepublishDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn publishDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn cityDataGridViewTextBoxColumn;
        private DB_BOOKSDataSet5 dB_BOOKSDataSet5;
        private System.Windows.Forms.BindingSource booksBindingSource1;
        private DB_BOOKSDataSet5TableAdapters.BooksTableAdapter booksTableAdapter1;
        private DB_BOOKSDataSet6 dB_BOOKSDataSet6;
        private System.Windows.Forms.BindingSource booksBindingSource2;
        private DB_BOOKSDataSet6TableAdapters.BooksTableAdapter booksTableAdapter2;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem работаСТабицамиToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem авторыToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem книгиToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem издательстваToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem поставщикиToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem поставкиToolStripMenuItem;
        private DB_BOOKSDataSet dB_BOOKSDataSet7;
        private System.Windows.Forms.DataGridView book;
        private System.Windows.Forms.DataGridViewTextBoxColumn codebookDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn titlebookDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn codeauthorDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn pagesDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn codepublishDataGridViewTextBoxColumn1;
        private System.Windows.Forms.ToolStripMenuItem работаСПроцедурамиToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem администрированиеToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem отчётыToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem отчётВТабличнойФормеToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem отчётВСвободнойФормеToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem отчётВToolStripMenuItem;
        private FastReport.Report report1;
        private FastReport.Report report2;
        private FastReport.Report report3;
    }
}

