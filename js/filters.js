function applyFilter() {
    const typeFilter = document.getElementById('type').value.toUpperCase();
    const rows = document.querySelectorAll('#vehicle-table tr');

    rows.forEach(row => {
        const typeCell = row.children[4].innerText.toUpperCase();
        row.style.display = typeFilter === '' || typeCell === typeFilter ? '' : 'none';
    });
}
