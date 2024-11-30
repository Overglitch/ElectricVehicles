from http.server import SimpleHTTPRequestHandler, HTTPServer
from urllib.parse import urlparse, parse_qs
from lxml import etree

class XSLTRequestHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        query = parse_qs(urlparse(self.path).query)
        stylesheet = query.get("stylesheet", [None])[0]

        if stylesheet and stylesheet.endswith(".xsl"):
            # Load XML and XSLT
            xml_file = "data/vehicles.xml"
            xslt_file = f"data/{stylesheet}"
            try:
                xml = etree.parse(xml_file)
                xslt = etree.parse(xslt_file)
                transform = etree.XSLT(xslt)
                result = transform(xml)

                # Respond with transformed HTML
                self.send_response(200)
                self.send_header("Content-Type", "text/html")
                self.end_headers()
                self.wfile.write(etree.tostring(result, pretty_print=True, encoding="utf-8"))
            except Exception as e:
                self.send_response(500)
                self.end_headers()
                self.wfile.write(f"Error: {str(e)}".encode("utf-8"))
        else:
            # Serve files as usual
            super().do_GET()

# Run server
PORT = 8000
httpd = HTTPServer(("localhost", PORT), XSLTRequestHandler)
print(f"Serving on http://localhost:{PORT}")
httpd.serve_forever()
