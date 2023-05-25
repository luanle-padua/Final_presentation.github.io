// Function to generate the chart showing the distribution of houses by city
function generateHousesByCityChart(data) {
  // Count the number of houses for each city
  const cityCounts = data.reduce((counts, item) => {
    const city = item.city;
    counts[city] = (counts[city] || 0) + 1;
    return counts;
  }, {});

  // Extract cities and their counts from the object
  const cities = Object.keys(cityCounts);
  const counts = Object.values(cityCounts);

  // Creating a pie chart
  const trace = {
    labels: cities,
    values: counts,
    type: 'pie',
    textinfo: 'label+percent',
    hoverinfo: 'value+percent',
  };

  const layout = {
    title: 'Distribution of Houses by City',
  };

  const chartData = [trace];
  Plotly.newPlot('chart1', chartData, layout);
}

// Function to generate the chart showing the house prices
function generateHousePricesChart(data) {
  const prices = data.map((item) => item.price);

  const trace = {
    x: prices,
    type: 'histogram',
  };

  const layout = {
    title: 'House Prices',
    xaxis: {
      title: 'Price',
    },
    yaxis: {
      title: 'Count',
    },
  };

  const chartData = [trace];
  Plotly.newPlot('chart2', chartData, layout);
}

// Function to generate the chart showing house prices vs. bedrooms
function generatePricesVsBedroomsChart(data) {
  const prices = data.map((item) => item.price);
  const bedrooms = data.map((item) => item.bedrooms);

  const trace = {
    x: bedrooms,
    y: prices,
    mode: 'markers',
    type: 'scatter',
  };

  const layout = {
    title: 'House Prices vs. Bedrooms',
    xaxis: {
      title: 'Bedrooms',
    },
    yaxis: {
      title: 'Price',
    },
  };

  const chartData = [trace];
  Plotly.newPlot('chart3', chartData, layout);
}

// Function to generate the scatter plot showing the correlation between bedrooms, bathrooms, and price
// Function to generate the scatter plot showing the correlation between bedrooms, bathrooms, and price
function generateCorrelationScatterPlot(data) {
  // Extracting the required columns from the data
  const correlationData = data.map((item) => [
    item.bedrooms,
    item.bathrooms,
    item.price,
  ]);

  // Creating a scatter plot
  const trace = {
    x: correlationData.map((item) => item[0]),
    y: correlationData.map((item) => item[1]),
    mode: 'markers',
    marker: {
      color: correlationData.map((item) => item[2]),
      colorscale: 'Viridis', // Specify the colorscale
      showscale: true, // Show the color scale on the side
      size: 10,
      colorbar: {
        title: 'Price', // Label for the color scale
      },
    },
    text: correlationData.map((item) => `Price: $${item[2]}`),
    hoverinfo: 'text',
    type: 'scatter',
  };

  const layout = {
    title: 'Correlation Scatter Plot',
    xaxis: {
      title: 'Number of Bedrooms',
    },
    yaxis: {
      title: 'Number of Bathrooms',
    },
  };

  const chartData = [trace];
  Plotly.newPlot('chart4', chartData, layout);
}


// Function to generate the expandable and collapsible data table
function generateDataTable(data) {
  const tableBody = document.querySelector('#data-table tbody');
  tableBody.innerHTML = '';

  data.forEach((item) => {
    const row = document.createElement('tr');
    row.innerHTML = `
      <td>${item.id}</td>
      <td>${item.title}</td>
      <td>${item.address}</td>
      <td>${item.city}</td>
      <td>${item.price}</td>
      <td>${item.bedrooms}</td>
      <td>${item.bathrooms}</td>
    `;
    tableBody.appendChild(row);
  });

  const dataTable = $('#data-table').DataTable();
  if ($.fn.DataTable.isDataTable('#data-table')) {
    dataTable.destroy();
  }

  $(document).ready(() => {
    $('#data-table').DataTable({
      lengthMenu: [10, 25, 50],
      pageLength: 10,
    });
  });
}

fetch("/data")
  .then((response) => response.json())
  .then((data) => {
    generateHousesByCityChart(data);
    generateHousePricesChart(data);
    generatePricesVsBedroomsChart(data);
    generateCorrelationScatterPlot(data);
    generateDataTable(data);
  })
  .catch((error) => console.error(error));
