import xmlschema

# Returns True if the XML document is valid, False if it’s invalid.
result = xmlschema.is_valid("./xsd_sample.xml", schema="./xsd_sample.xsd")

print("Valid") if result else print("Invalid")
