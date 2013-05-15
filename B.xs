<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns="http://www.przyklad.pl"
targetNamespace="http://www.przyklad.pl"
>

    <xs:annotation>
        <xs:documentation>s3 grupa B Mateusz Zajac. Dokument schemy validuje sie bez bledow
        dokument xml ma blad przy validacji.
			Blad typu No matching global declaration available for the validation root.
			wystepujacy przy validacji przedstawilem Panu na poprzednich zajeciach i nie udalo
			nam sie go rozwiazac. Licze na to, ze nie wplynie on na moja punktacje wlasnie 
			z tego powodu.</xs:documentation>
    </xs:annotation>


<!-- definition of simple elements -->
<xs:element name="miasto">
  <xs:simpleType>
    <xs:restriction base="xs:string">
      <xs:minLength value="5"/>
      <xs:maxLength value="30"/>
    </xs:restriction>
  </xs:simpleType>
</xs:element>
<xs:element name="nazwa" type="xs:string"/>
<xs:element name="wielkosc_dostawy">
	<xs:simpleType>
		<xs:restriction base="xs:positiveInteger">
			<xs:minInclusive value="10"/>
			<xs:maxInclusive value="50"/>
		</xs:restriction>
	</xs:simpleType>
</xs:element>

<xs:element name="cena" type="xs:string"/>

<xs:element name="lozko" type="xs:string"/>
<xs:element name="szafa_nocna" type="xs:string"/>


<!-- definition of attributes -->
<xs:attribute name="kraj_poch">
	<xs:simpleType>
		<xs:restriction base="xs:string">
			<xs:enumeration value="PL"/>
			<xs:enumeration value="DN"/>
		</xs:restriction>
	</xs:simpleType>
</xs:attribute>




<!-- definition of complex elements -->

<xs:element name="komplet">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="nazwa"/>
      <xs:element ref="cena"/>
      <xs:choice>
		<xs:element ref="lozko"/>
		<xs:element ref="szafa_nocna"/>
      </xs:choice>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="krzeslo">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="nazwa"/>
      <xs:element ref="cena"/>
    </xs:sequence>
    <xs:attribute ref="kraj_poch" use="required"/>
  </xs:complexType>
</xs:element>

<xs:element name="meble">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="krzeslo" minOccurs="1"/>
      <xs:element ref="komplet"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="dostawca">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="miasto"/>
      <xs:element ref="nazwa"/>
      <xs:element ref="wielkosc_dostawy"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="sklep_meblowy">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="dostawca"/>
      <xs:element ref="meble"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

</xs:schema>
